package com.groupeisi.bien_backend.dto;

import lombok.*;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class BienDto {

    private Long id;
    private String titre;
    private String description;
    private double prix;
}
