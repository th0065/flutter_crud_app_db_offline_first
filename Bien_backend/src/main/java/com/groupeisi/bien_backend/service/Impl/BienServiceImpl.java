package com.groupeisi.bien_backend.service.Impl;

import com.groupeisi.bien_backend.dto.BienDto;
import com.groupeisi.bien_backend.entity.Bien;
import com.groupeisi.bien_backend.repo.BienRepo;
import com.groupeisi.bien_backend.service.BienService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class BienServiceImpl implements BienService {

    @Autowired
    private BienRepo bienRepo;

    @Override
    public BienDto createBien(BienDto bienDto) {
        Bien bien = new Bien();
        bien.setId(bienDto.getId());
        bien.setDescription(bienDto.getDescription());
        bien.setPrix(bienDto.getPrix());
        bien.setTitre(bienDto.getTitre());
        bienRepo.save(bien);
      
        return bienDto;
    }

    @Override
    public Optional<Bien> getBienById(long id) {
        Optional<Bien> bien = bienRepo.findById(id);
        return bien;
    }

    @Override
    public List<Bien> getAllBiens() {
        List<Bien> biens = bienRepo.findAll();
        return biens;
    }

    @Override
    public BienDto updateBien(long id, BienDto BienDto) {
        if (bienRepo.findById(id).isPresent()) {
            Bien bien = bienRepo.findById(id).get();
            bien.setDescription(BienDto.getDescription());
            bien.setPrix(BienDto.getPrix());
            bien.setTitre(BienDto.getTitre());
            bienRepo.save(bien);
            return BienDto;
        }
        else {
            return null;
        }

    }

    @Override
    public void deleteBien(long id) {
        bienRepo.deleteById(id);

    }
}
