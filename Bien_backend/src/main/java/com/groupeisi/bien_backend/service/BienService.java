package com.groupeisi.bien_backend.service;


import com.groupeisi.bien_backend.dto.BienDto;
import com.groupeisi.bien_backend.entity.Bien;

import java.util.List;
import java.util.Optional;

public interface BienService {

    BienDto createBien(BienDto BienDto);

    // Lire une année académique par son ID
    Optional<Bien> getBienById(long id);

    // Lire toutes les années académiques
    List<Bien> getAllBiens();

    // Mettre à jour une année académique
    BienDto updateBien(long id, BienDto BienDto);

    // Supprimer une année académique
    void deleteBien(long id);
}
