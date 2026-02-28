-- Projet : Tifosi
-- Auteur : Chatelier
-- Date : 2026

-- =====================================
-- Création utilisateur tifosi
-- =====================================

DROP USER IF EXISTS 'tifosi'@'localhost';

CREATE USER 'tifosi'@'localhost'
IDENTIFIED BY 'MotDePasseFort!';

GRANT ALL PRIVILEGES
ON tifosi.*
TO 'tifosi'@'localhost';