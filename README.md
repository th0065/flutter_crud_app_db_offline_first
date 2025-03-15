# Gestion de Biens Immobiliers - Backend (Spring Boot) et Frontend (Flutter)

Ce projet est une application de gestion de biens immobiliers avec un backend en Spring Boot et un frontend en Flutter. 
L'application permet de gérer des biens immobiliers (ajout, modification, suppression) avec une base de données locale (offline-first) et une synchronisation avec un backend.

 Fonctionnalités

- Backend (Spring Boot) :
  - API REST pour la gestion des biens immobiliers.
  - Base de données H2 (en mémoire) .
  - Synchronisation des données avec le frontend.

- Frontend (Flutter) :
  - Interface utilisateur pour ajouter, modifier et supprimer des biens.
  - Base de données locale avec `sqflite` pour un mode offline-first.
  - Synchronisation des données avec le backend.

 Prérequis

- Backend :
  - Java 17.
  - Maven pour la gestion des dépendances.
  - Base de données H2 ou MySQL.

- Frontend :
  - Flutter SDK (version stable recommandée).
  - Android Studio ou VS Code avec les extensions Flutter et Dart.

 Installation

# Backend (Spring Boot)

1. Clonez ce dépôt :
   
     git clone https://github.com/th0065/flutter_crud_app_db_offline_first.git
     cd flutter_crud_app_db_offline_first/backend
