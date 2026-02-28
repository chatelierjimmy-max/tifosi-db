-- Script de peuplement
-- Import des données CSV

USE tifosi;
SET FOREIGN_KEY_CHECKS = 0;
SET FOREIGN_KEY_CHECKS = 1;
USE tclientifosi;

-- Nettoyage (optionnel si tu recommences)
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE achete;
TRUNCATE TABLE contient;
TRUNCATE TABLE menu;
TRUNCATE TABLE comprend;
TRUNCATE TABLE boisson;
TRUNCATE TABLE marque;
TRUNCATE TABLE focaccia;
TRUNCATE TABLE ingredient;
TRUNCATE TABLE client;
SET FOREIGN_KEY_CHECKS = 1;

-- MARQUE
INSERT INTO marque (id_marque, nom) VALUES
(1, 'Coca-Cola'),
(2, 'PepsiCo');

-- BOISSON
INSERT INTO boisson (id_boisson, nom, id_marque) VALUES
(1, 'Coca-Cola', 1),
(2, 'Coca-Cola Zéro', 1),
(3, 'Pepsi', 2);

-- INGREDIENT
INSERT INTO ingredient (id_ingredient, nom) VALUES
(1, 'Tomate'),
(2, 'Mozzarella'),
(3, 'Jambon'),
(4, 'Basilic');

-- FOCCACIA
INSERT INTO focaccia (id_focaccia, nom, prix) VALUES
(1, 'Margherita', 9.90),
(2, 'Jambon Mozza', 11.50);

-- COMPREND (recette)
INSERT INTO comprend (id_focaccia, id_ingredient, quantite) VALUES
(1, 1, 120),
(1, 2, 100),
(1, 4, 5),
(2, 1, 100),
(2, 2, 90),
(2, 3, 80);

-- MENU
INSERT INTO menu (id_menu, nom, prix, id_focaccia) VALUES
(1, 'Menu Margherita', 12.90, 1),
(2, 'Menu Jambon Mozza', 14.50, 2);

-- CONTIENT (menu ↔ boisson)
INSERT INTO contient (id_menu, id_boisson) VALUES
(1, 1),
(1, 2),
(2, 3);

-- CLIENT
INSERT INTO client (id_client, nom, email, code_postal) VALUES
(1, 'Alice Martin', 'alice@example.com', 75001),
(2, 'Karim Diallo', 'karim@example.com', 69002);

-- ACHETE (client ↔ menu + date)
INSERT INTO achete (id_client, id_menu, date_achat) VALUES
(1, 1, '2026-02-20'),
(1, 2, '2026-02-21'),
(2, 1, '2026-02-22');