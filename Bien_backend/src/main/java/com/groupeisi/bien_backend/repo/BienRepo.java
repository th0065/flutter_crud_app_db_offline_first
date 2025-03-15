package com.groupeisi.bien_backend.repo;

import com.groupeisi.bien_backend.entity.Bien;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface BienRepo extends JpaRepository<Bien, Long> {
}
