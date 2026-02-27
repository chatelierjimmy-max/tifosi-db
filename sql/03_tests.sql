USE tifosi;

-- ===============================
-- 1. Vérifier toutes les tables
-- ===============================
SHOW TABLES;


-- ===============================
-- 2. Liste des focaccias + prix
-- ===============================
SELECT nom, prix
FROM focaccia;


-- ===============================
-- 3. Menus avec leur focaccia
-- ===============================
SELECT m.nom AS menu,
       f.nom AS focaccia,
       m.prix
FROM menu m
JOIN focaccia f
ON m.id_focaccia = f.id_focaccia;


-- ===============================
-- 4. Boissons contenues dans chaque menu
-- ===============================
SELECT m.nom AS menu,
       b.nom AS boisson
FROM contient c
JOIN menu m ON c.id_menu = m.id_menu
JOIN boisson b ON c.id_boisson = b.id_boisson
ORDER BY menu;


-- ===============================
-- 5. Achats clients
-- ===============================
SELECT cl.nom,
       cl.prenom,
       m.nom AS menu,
       a.date_achat
FROM achete a
JOIN client cl ON a.id_client = cl.id_client
JOIN menu m ON a.id_menu = m.id_menu
ORDER BY a.date_achat;

USE tifosi;

-- ==========================================================
-- CHECK 1) Boissons sans marque (FK boisson -> marque)
-- Attendu : 0 ligne
-- ==========================================================
SELECT b.*
FROM boisson b
LEFT JOIN marque m ON m.id_marque = b.id_marque
WHERE m.id_marque IS NULL;

-- ==========================================================
-- CHECK 2) Menus sans focaccia (FK menu -> focaccia)
-- Attendu : 0 ligne
-- ==========================================================
SELECT me.*
FROM menu me
LEFT JOIN focaccia f ON f.id_focaccia = me.id_focaccia
WHERE f.id_focaccia IS NULL;

-- ==========================================================
-- CHECK 3) contient : id_menu inexistant
-- Attendu : 0 ligne
-- ==========================================================
SELECT co.*
FROM contient co
LEFT JOIN menu me ON me.id_menu = co.id_menu
WHERE me.id_menu IS NULL;

-- ==========================================================
-- CHECK 4) contient : id_boisson inexistant
-- Attendu : 0 ligne
-- ==========================================================
SELECT co.*
FROM contient co
LEFT JOIN boisson b ON b.id_boisson = co.id_boisson
WHERE b.id_boisson IS NULL;

-- ==========================================================
-- CHECK 5) comprend : id_focaccia inexistant
-- Attendu : 0 ligne
-- ==========================================================
SELECT c.*
FROM comprend c
LEFT JOIN focaccia f ON f.id_focaccia = c.id_focaccia
WHERE f.id_focaccia IS NULL;

-- ==========================================================
-- CHECK 6) comprend : id_ingredient inexistant
-- Attendu : 0 ligne
-- ==========================================================
SELECT c.*
FROM comprend c
LEFT JOIN ingredient i ON i.id_ingredient = c.id_ingredient
WHERE i.id_ingredient IS NULL;

-- ==========================================================
-- CHECK 7) achete : client inexistant
-- Attendu : 0 ligne
-- ==========================================================
SELECT a.*
FROM achete a
LEFT JOIN client c ON c.id_client = a.id_client
WHERE c.id_client IS NULL;

-- ==========================================================
-- CHECK 8) achete : menu inexistant
-- Attendu : 0 ligne
-- ==========================================================
SELECT a.*
FROM achete a
LEFT JOIN menu m ON m.id_menu = a.id_menu
WHERE m.id_menu IS NULL;

-- ==========================================================
-- CHECK 9) Doublons dans contient (PK composite devrait empêcher)
-- Attendu : 0 ligne
-- ==========================================================
SELECT id_menu, id_boisson, COUNT(*) AS nb
FROM contient
GROUP BY id_menu, id_boisson
HAVING COUNT(*) > 1;

-- ==========================================================
-- CHECK 10) Doublons dans comprend (PK composite devrait empêcher)
-- Attendu : 0 ligne
-- ==========================================================
SELECT id_focaccia, id_ingredient, COUNT(*) AS nb
FROM comprend
GROUP BY id_focaccia, id_ingredient
HAVING COUNT(*) > 1;