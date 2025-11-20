

--  1. Récupérer la liste des thèmes

SELECT name FROM themes;


-- 2. Récupérer toutes les ressources triées par date de mise à jour

SELECT *
FROM resources
ORDER BY update_at DESC;


-- 3. Récupérer le nom et l'url des ressources de type exercice

SELECT title, url
FROM resources
WHERE type = 'exercice';


-- 4. Récupérer le titre et la description des ressources d'Ada uniquement

SELECT title, description
FROM resources
WHERE is_ada = TRUE;


-- 5. Récupérer les ressources qui ont la compétence JavaScript

SELECT
    resources.title,
    resources.description
FROM
    resources
JOIN
    resources_skills ON resources.id = resources_skills.resources_id
JOIN
    skills ON resources_skills.skills_id = skills.id
WHERE title ILIKE '%JavaScript%';


-- 6. Récupérer les ressources dont le titre contient "react" (peu importe la casse)
SELECT title, url
FROM resources
WHERE title ILIKE '%react%';


