# Procédure complète pour se connecter à *adatabase* depuis le terminal

*(y compris si aucune table n'est installée)*

## 1. Ouvrir PostgreSQL dans le terminal

``` bash
psql postgres
```

ou avec un utilisateur :

``` bash
psql -U <utilisateur> postgres
```

------------------------------------------------------------------------

## 2. Vérifier si la base existe

``` sql
\l
```

Si **adatabase** n'apparaît pas → passe à l'étape suivante.

------------------------------------------------------------------------

## 3. Créer la base si elle n'existe pas

``` sql
CREATE DATABASE adatabase;
```

Puis s'y connecter :

``` sql
\c adatabase
```

------------------------------------------------------------------------

## 4. Vérifier s'il y a déjà des tables

``` sql
\d
```

-   Si **aucune table n'est listée** → c'est normal, continue.\
-   Si un message du type *"Did not find any relation"* apparaît → cela
    signifie qu'aucune table n'est installée.

------------------------------------------------------------------------

## 5. Installer les tables et les données via un fichier SQL

### Option A : se placer dans le dossier où se trouve le fichier

Dans le terminal avant d'ouvrir psql :

``` bash
cd /chemin/du/dossier
psql adatabase
```

Puis dans psql :

``` sql
\i migration_up.sql
```

### Option B : utiliser le chemin complet du fichier

Dans psql :

``` sql
\i /chemin/complet/migration_up.sql
```

⚠️ Si le fichier n'existe pas ou si le chemin est incorrect, psql
affichera :\
**"No such file or directory"**

------------------------------------------------------------------------

## 6. Re‑vérifier les tables après installation

``` sql
\d
```

Tu dois désormais voir la liste des tables créées par
*migration_up.sql*.

------------------------------------------------------------------------

## 7. Tester les requêtes SQL

``` sql
SELECT * FROM nom_de_la_table;
INSERT INTO nom_de_la_table (...) VALUES (...);
UPDATE nom_de_la_table SET ... WHERE ...;
DELETE FROM nom_de_la_table WHERE ...;
```

------------------------------------------------------------------------

## 8. Quitter psql

``` sql
\q
```

------------------------------------------------------------------------

## 9. En cas d'erreur fréquente

-   **"relation does not exist"** → la table n'a pas été créée (mauvais
    fichier SQL ou fichier non exécuté).\
-   **"No such file or directory"** → mauvais chemin du fichier SQL.\
-   **Base introuvable** → il faut refaire `CREATE DATABASE` puis `\c`.

------------------------------------------------------------------------

Fin de procédure.
