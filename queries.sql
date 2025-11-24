

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

-- BONUS

-- 1. Récupérer la liste des thèmes avec le nombre de ressources par thème
SELECT
    themes.name AS theme_name,
    COUNT(resources.id) AS resource_count
FROM
    themes
LEFT JOIN
    resources ON themes.id = resources.theme_id
GROUP BY
    themes.name;


-- 2. Récupérer le nom et l'url de toutes les ressources avec un tableau/liste contenant l'ensemble de leurs skills associés
SELECT
    resources.title,
    resources.url,
    ARRAY_AGG(skills.name) AS skills
FROM
    resources
LEFT JOIN
    resources_skills ON resources.id = resources_skills.resources_id
LEFT JOIN
    skills ON resources_skills.skills_id = skills.id
GROUP BY
    resources.id;


-- 3. Récupérer les 5 ressources les plus récentes avec leur thème
SELECT
    resources.title,
    resources.created_at,
    themes.name AS theme_name
FROM
    resources
LEFT JOIN
    themes ON resources.theme_id = themes.id
ORDER BY
    resources.created_at DESC
LIMIT 3;


-- 4. Récupérer toutes les compétences qui ne sont associées à aucune ressource
SELECT
    skills.name
FROM
    skills
LEFT JOIN
    resources_skills ON skills.id = resources_skills.skills_id
WHERE
    resources_skills.skills_id IS NULL;


