package com.docvault.document.service;

import com.docvault.document.model.DocumentItem;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.IOException;
import java.time.Instant;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import java.util.concurrent.locks.ReentrantReadWriteLock;

@Slf4j
@Service
public class DocumentJsonStorageService {

    private static final String STORAGE_DIR = "data";
    private static final String STORAGE_FILE = "data/documents.json";

    private final ObjectMapper objectMapper;
    private final ReentrantReadWriteLock lock = new ReentrantReadWriteLock();

    public DocumentJsonStorageService(ObjectMapper objectMapper) {
        this.objectMapper = objectMapper;
        initStorage();
    }

    private void initStorage() {
        File dir = new File(STORAGE_DIR);
        if (!dir.exists()) {
            boolean created = dir.mkdirs();
            log.info("Created storage directory 'data': {}", created);
        }

        File file = new File(STORAGE_FILE);
        if (!file.exists()) {
            try {
                objectMapper.writeValue(file, new ArrayList<DocumentItem>());
                log.info("Initialized empty JSON document storage file: {}", STORAGE_FILE);
            } catch (IOException e) {
                log.error("Failed to initialize JSON document storage file", e);
            }
        }
    }

    public List<DocumentItem> getAllDocuments() {
        lock.readLock().lock();
        try {
            File file = new File(STORAGE_FILE);
            if (!file.exists()) {
                return new ArrayList<>();
            }
            return objectMapper.readValue(file, new TypeReference<List<DocumentItem>>() {});
        } catch (IOException e) {
            log.error("Error reading documents from JSON storage file", e);
            return new ArrayList<>();
        } finally {
            lock.readLock().unlock();
        }
    }

    public DocumentItem saveDocument(DocumentItem document) {
        lock.writeLock().lock();
        try {
            List<DocumentItem> list = getAllDocuments();
            if (document.getId() == null || document.getId().isBlank()) {
                document.setId(UUID.randomUUID().toString());
            }
            if (document.getCreatedAt() == null) {
                document.setCreatedAt(Instant.now());
            }
            if (document.getStatus() == null || document.getStatus().isBlank()) {
                document.setStatus("Valid");
            }

            list.add(0, document);

            File file = new File(STORAGE_FILE);
            objectMapper.writerWithDefaultPrettyPrinter().writeValue(file, list);
            log.info("Successfully saved document with ID {} to {}", document.getId(), STORAGE_FILE);
            return document;
        } catch (IOException e) {
            log.error("Failed to write document to JSON storage file", e);
            throw new RuntimeException("Error persisting document to JSON file storage", e);
        } finally {
            lock.writeLock().unlock();
        }
    }
}
