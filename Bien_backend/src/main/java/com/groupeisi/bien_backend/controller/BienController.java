package com.groupeisi.bien_backend.controller;

import com.groupeisi.bien_backend.dto.BienDto;
import com.groupeisi.bien_backend.entity.Bien;
import com.groupeisi.bien_backend.service.BienService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/biens")
@CrossOrigin("*")
public class BienController {

    @Autowired
    private BienService bienService;

    // Endpoint pour créer un bien
    @PostMapping
    public ResponseEntity<BienDto> createBien(@RequestBody BienDto bienDto) {
        BienDto createdBien = bienService.createBien(bienDto);
        return new ResponseEntity<>(createdBien, HttpStatus.CREATED);
    }

    // Endpoint pour récupérer un bien par son ID
    @GetMapping("/{id}")
    public ResponseEntity<Bien> getBienById(@PathVariable long id) {
        Optional<Bien> bien = bienService.getBienById(id);
        return bien.map(ResponseEntity::ok).orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
    }

    // Endpoint pour récupérer tous les biens
    @GetMapping
    public ResponseEntity<List<Bien>> getAllBiens() {
        List<Bien> biens = bienService.getAllBiens();
        return new ResponseEntity<>(biens, HttpStatus.OK);
    }

    // Endpoint pour mettre à jour un bien
    @PutMapping("/{id}")
    public ResponseEntity<BienDto> updateBien(@PathVariable long id, @RequestBody BienDto bienDto) {
        BienDto updatedBien = bienService.updateBien(id, bienDto);
        if (updatedBien != null) {
            return new ResponseEntity<>(updatedBien, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    // Endpoint pour supprimer un bien
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteBien(@PathVariable long id) {
        bienService.deleteBien(id);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }
}