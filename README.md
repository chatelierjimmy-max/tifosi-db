# Projet Base de Données — Tifosi DB

## Description du projet

Ce projet consiste à concevoir et implémenter une base de données relationnelle pour la gestion d’un restaurant italien **Tifosi**.

La base permet de gérer :

* les clients
* les menus
* les focaccias
* les ingrédients
* les boissons
* les achats effectués par les clients

Le projet a été réalisé avec **MySQL** et **MySQL Workbench**.

---

## Structure du projet

```
tifosi-db/
│
├── schema/
│   └── 01_schema.sql      → Création des tables et contraintes
│
├── seed/
│   └── 02_seed.sql        → Insertion des données initiales
│
├── tests/
│   └── 03_tests.sql       → Requêtes SQL de validation
│
├── README.md
└── .gitignore
```

---

## Modèle de données

La base repose sur plusieurs entités principales :

* **client**
* **menu**
* **focaccia**
* **ingredient**
* **boisson**
* **marque**

Tables d’association :

* **comprend** → relation focaccia / ingrédient
* **contient** → relation menu / boisson
* **achete** → achats réalisés par les clients

Les clés étrangères assurent l’intégrité référentielle.

---

## Installation

### 1️ Créer la base de données

```sql
CREATE DATABASE tifosi;
USE tifosi;
```

---

### 2️ Exécuter le schéma

Importer :

```
01_schema.sql
```

---

### 3️ Insérer les données

Importer :

```
02_seed.sql
```

---

### 4️ Lancer les tests

Exécuter :

```
03_tests.sql
```

---

## Requêtes indispensables (Tests)

Le fichier `03_tests.sql` contient notamment :

* Liste des achats clients
* Menus et boissons associées
* Composition des focaccias
* Vérification des doublons
* Contrôle d’intégrité des relations

---

## Technologies utilisées

* MySQL 8+
* MySQL Workbench
* Git / GitHub

---

## Auteur

Projet réalisé par : **[chatelier]**
Formation : Base de Données
Année : 2026

---

## Licence

Projet pédagogique réalisé dans le cadre d’un apprentissage SQL.

# Tifosi — Base de données MySQL

Ce dépôt contient les livrables demandés dans le brief **« Concevoir une base de données avec MySQL »** (BDD `tifosi`, schéma + données de test + requêtes de vérification). fileciteturn0file0

## Contenu

- `sql/01_schema.sql` : création de la base `tifosi`, de l'utilisateur `tifosi` et du schéma (tables + contraintes).
- `sql/02_seed.sql` : insertion des données de test (issues des fichiers Excel fournis) + quelques données optionnelles (menus/clients/achats).
- `sql/03_tests.sql` : script regroupant les 10 requêtes de test (avec commentaires et résultats attendus/obtenus sur les données de test).

## Prérequis

- MySQL 8+ (recommandé)
- Un compte MySQL avec droits d'administration (pour exécuter le bloc `CREATE USER`), sinon commentez ce bloc.

## Exécution (exemple)

```bash
# 1) Schéma
mysql -u root -p < sql/01_schema.sql

# 2) Données de test
mysql -u root -p < sql/02_seed.sql

# 3) Requêtes de vérification
mysql -u root -p < sql/03_tests.sql
```

Ensuite vous pouvez vous connecter avec l'utilisateur applicatif :

```bash
mysql -u tifosi -p tifosi
```

## Notes de modélisation

Le schéma suit le MCD du brief :
- `focaccia` ↔ `ingredient` via `comprend(quantite_g)`
- `boisson` → `marque`
- `menu` (constitué d'1 focaccia) ↔ `boisson` via `contient`
- `client` ↔ `menu` via `achat(date_achat)`
