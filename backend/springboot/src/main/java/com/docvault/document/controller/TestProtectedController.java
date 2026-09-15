package com.docvault.document.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequestMapping("/api/v1/protected-test")
public class TestProtectedController {

    @GetMapping
    public ResponseEntity<Map<String, String>> getProtectedResource() {
        return ResponseEntity.ok(Map.of("message", "Access Granted to Protected Resource"));
    }
}
