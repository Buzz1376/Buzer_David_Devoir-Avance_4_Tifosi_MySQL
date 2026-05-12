-- Exécution des tests
USE tifosi;

-- 1/ Afficher la liste des noms des focaccias par ordre alphabétique croissant
SELECT nom AS focaccia
FROM focaccia
ORDER BY nom ASC;

-- 2/ Afficher le nombre total d'ingrédients
SELECT COUNT(*) AS nb_ingredients
FROM ingredient;

-- 3/ Afficher le prix moyen des focaccias
SELECT ROUND(AVG(prix), 2) AS prix_moyen_focaccia
FROM focaccia;

-- 4/ Afficher la liste des boissons avec leur marque, triée par nom de boisson
SELECT b.nom AS boisson, m.nom AS marque
FROM boisson b
JOIN marque m ON m.id = b.marque_id
ORDER BY b.nom ASC;

-- 5/ Afficher la liste des ingrédients pour une Raclaccia
SELECT i.nom AS ingredient
FROM focaccia f
JOIN focaccia_ingredient fi ON fi.focaccia_id = f.id
JOIN ingredient i ON i.id = fi.ingredient_id
WHERE f.nom = 'Raclaccia'

-- 6/ Afficher le nom et le nombre d'ingrédients pour chaque focaccia
SELECT f.nom AS focaccia, COUNT(fi.ingredient_id) AS nb_ingredients
FROM focaccia f
LEFT JOIN focaccia_ingredient fi ON fi.focaccia_id = f.id
GROUP BY f.id, f.nom

-- 7/ Afficher le nom de la focaccia qui a le plus d'ingrédients
SELECT f.nom AS focaccia, COUNT(fi.ingredient_id) AS nb_ingredients
FROM focaccia f
LEFT JOIN focaccia_ingredient fi ON fi.focaccia_id = f.id
GROUP BY f.id, f.nom
LIMIT 1;

-- 8/ Afficher la liste des focaccias qui contiennent de l'ail
SELECT DISTINCT f.nom AS focaccia
FROM focaccia f
JOIN focaccia_ingredient fi ON fi.focaccia_id = f.id
JOIN ingredient i ON i.id = fi.ingredient_id
WHERE i.nom = 'Ail'

-- 9/ Afficher la liste des ingrédients inutilisés
SELECT i.nom AS ingredients_inutiles
FROM ingredient i
LEFT JOIN focaccia_ingredient fi ON fi.ingredient_id = i.id
WHERE fi.ingredient_id IS NULL

-- 10/ Afficher la liste des focaccias qui n'ont pas de champignons
SELECT f.nom AS liste_focaccia_sans_champignons
FROM focaccia f
WHERE NOT EXISTS (
  SELECT 1
  FROM focaccia_ingredient fi
  JOIN ingredient i ON i.id = fi.ingredient_id
  WHERE fi.focaccia_id = f.id
    AND i.nom = 'Champignon'
)
