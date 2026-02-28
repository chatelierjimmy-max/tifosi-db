-- Projet BDD Tifosi
-- Script de création
-- Auteur : chatelier

DROP DATABASE IF EXISTS tifosi;
CREATE DATABASE tifosi;
USE tifosi;

CREATE TABLE IF NOT EXISTS ingredient (
    id_ingredient INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL
);
CREATE TABLE IF NOT EXISTS marque (
    id_marque INT AUTO_INCREMENT PRIMARY KEY,
	nom VARCHAR(50) NOT NULL
);
CREATE TABLE IF NOT EXISTS boisson (
    id_boisson INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    id_marque INT NOT NULL,
    FOREIGN KEY (id_marque)
        REFERENCES marque(id_marque)
);
CREATE TABLE IF NOT EXISTS focaccia (
    id_focaccia INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    prix DECIMAL(5,2) NOT NULL
);
CREATE TABLE IF NOT EXISTS comprend (
    id_focaccia INT NOT NULL,
    id_ingredient INT NOT NULL,
    quantite INT NOT NULL,
    PRIMARY KEY (id_focaccia, id_ingredient),
    FOREIGN KEY (id_focaccia) REFERENCES focaccia(id_focaccia),
    FOREIGN KEY (id_ingredient) REFERENCES ingredient(id_ingredient)
);
CREATE TABLE IF NOT EXISTS menu (
    id_menu INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    prix DECIMAL(5,2) NOT NULL,
    id_focaccia INT NOT NULL,
    FOREIGN KEY (id_focaccia) REFERENCES focaccia(id_focaccia)
);
CREATE TABLE IF NOT EXISTS contient (
    id_menu INT NOT NULL,
    id_boisson INT NOT NULL,
    PRIMARY KEY (id_menu, id_boisson),
    FOREIGN KEY (id_menu) REFERENCES menu(id_menu),
    FOREIGN KEY (id_boisson) REFERENCES boisson(id_boisson)
);

CREATE TABLE client (
  id_client INT AUTO_INCREMENT PRIMARY KEY,
  nom VARCHAR(50) NOT NULL,
  prenom VARCHAR(50) NOT NULL
);


CREATE TABLE achete (
  id_client INT NOT NULL,
  id_menu INT NOT NULL,
  date_achat DATE NOT NULL,
  PRIMARY KEY (id_client, id_menu, date_achat),
  FOREIGN KEY (id_client) REFERENCES client(id_client),
  FOREIGN KEY (id_menu) REFERENCES menu(id_menu)
);

SHOW TABLES;