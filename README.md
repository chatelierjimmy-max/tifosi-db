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
