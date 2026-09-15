package com.docvault.document.controller;

import com.docvault.document.model.DocumentItem;
import com.docvault.document.service.DocumentJsonStorageService;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/v1/documents")
public class DocumentController {

    private final DocumentJsonStorageService documentStorageService;

    public DocumentController(DocumentJsonStorageService documentStorageService) {
        this.documentStorageService = documentStorageService;
    }

    @GetMapping
    public ResponseEntity<List<DocumentItem>> getAllDocuments() {
        return ResponseEntity.ok(documentStorageService.getAllDocuments());
    }

    @PostMapping
    public ResponseEntity<DocumentItem> createDocument(@Valid @RequestBody DocumentItem document) {
        DocumentItem saved = documentStorageService.saveDocument(document);
        return ResponseEntity.status(HttpStatus.CREATED).body(saved);
    }
}
