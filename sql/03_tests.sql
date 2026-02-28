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
-- CHECK 1) Liste des noms des focaccias (ordre alphabétique)
-- Attendu : toutes les focaccias, triées A -> Z
-- Obtenu : (à remplir)
-- Écart : (à remplir)
-- ==========================================================
SELECT f.nom
FROM focaccia f
ORDER BY f.nom ASC;

-- ==========================================================
-- CHECK 2) Nombre total d'ingrédients
-- Attendu : 1 ligne, 1 nombre
-- Obtenu : (à remplir)
-- Écart : (à remplir)
-- ==========================================================
SELECT COUNT(*) AS nb_ingredients
FROM ingredient;

-- ==========================================================
-- CHECK 3) Prix moyen des focaccias
-- Attendu : 1 ligne, 1 nombre (moyenne)
-- Obtenu : (à remplir)
-- Écart : (à remplir)
-- ==========================================================
SELECT AVG(f.prix) AS prix_moyen_focaccias
FROM focaccia f;

-- ==========================================================
-- CHECK 4) Liste des boissons avec leur marque, triée par nom de boisson
-- Attendu : boissons + marque associée, triées par boisson
-- Obtenu : (à remplir)
-- Écart : (à remplir)
-- ==========================================================
SELECT b.nom AS boisson, m.nom AS marque
FROM boisson b
JOIN marque m ON m.id_marque = b.id_marque
ORDER BY b.nom ASC;

-- ==========================================================
-- CHECK 5) Liste des ingrédients pour la focaccia "Raclaccia"
-- Attendu : ingrédients de Raclaccia (plusieurs lignes)
-- Obtenu : (à remplir)
-- Écart : (à remplir)
-- ==========================================================
SELECT i.nom AS ingredient
FROM focaccia f
JOIN comprend c ON c.id_focaccia = f.id_focaccia
JOIN ingredient i ON i.id_ingredient = c.id_ingredient
WHERE f.nom = 'Raclaccia'
ORDER BY i.nom;

-- ==========================================================
-- CHECK 6) Nom + nombre d'ingrédients pour chaque focaccia
-- Attendu : 1 ligne par focaccia
-- Obtenu : (à remplir)
-- Écart : (à remplir)
-- ==========================================================
SELECT f.nom, COUNT(c.id_ingredient) AS nb_ingredients
FROM focaccia f
LEFT JOIN comprend c ON c.id_focaccia = f.id_focaccia
GROUP BY f.id_focaccia, f.nom
ORDER BY f.nom;

-- ==========================================================
-- CHECK 7) focaccia ayant le plus d'ingrédients
-- Attendu : 1 ou plusieurs lignes si égalité
-- ==========================================================
SELECT f.nom, COUNT(c.id_ingredient) AS nb_ingredients
FROM focaccia f
JOIN comprend c 
    ON c.id_focaccia = f.id_focaccia
GROUP BY f.id_focaccia, f.nom
HAVING COUNT(c.id_ingredient) = (
    SELECT MAX(nb)
    FROM (
        SELECT COUNT(*) AS nb
        FROM comprend
        GROUP BY id_focaccia
    ) AS sous_req
);

-- ==========================================================
-- CHECK 8) Liste des focaccias qui contiennent de l'ail
-- Attendu : focaccias où ingredient.nom = 'Ail' (ou 'ail')
-- Obtenu : (à remplir)
-- Écart : (à remplir)
-- ==========================================================
SELECT DISTINCT f.nom
FROM focaccia f
JOIN comprend c ON c.id_focaccia = f.id_focaccia
JOIN ingredient i ON i.id_ingredient = c.id_ingredient
WHERE LOWER(i.nom) = 'ail'
ORDER BY f.nom;

-- ==========================================================
-- CHECK 9) Liste des ingrédients inutilisés (jamais dans comprend)
-- Attendu : ingrédients sans aucune association
-- Obtenu : (à remplir)
-- Écart : (à remplir)
-- ==========================================================
SELECT i.nom
FROM ingredient i
LEFT JOIN comprend c ON c.id_ingredient = i.id_ingredient
WHERE c.id_ingredient IS NULL
ORDER BY i.nom;

-- ==========================================================
-- CHECK 10) Liste des focaccias qui n'ont pas de champignons
-- Attendu : focaccias dont aucun ingrédient = 'Champignon(s)'
-- Obtenu : (à remplir)
-- Écart : (à remplir)
-- ==========================================================
SELECT f.nom
FROM focaccia f
WHERE NOT EXISTS (
  SELECT 1
  FROM comprend c
  JOIN ingredient i ON i.id_ingredient = c.id_ingredient
  WHERE c.id_focaccia = f.id_focaccia
    AND LOWER(i.nom) IN ('champignon', 'champignons')
)
ORDER BY f.nom;
