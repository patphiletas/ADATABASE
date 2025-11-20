INSERT INTO themes (id, name, description)
VALUES
(1,'Frontend', 'Tout ce qui concerne le développement côté navigateur'),
(2,'Backend', 'Développement côté serveur'),
(3,'Base de données', 'SQL, PostgreSQL, schémas'),  
(4,'DevOps', 'Automatisation, déploiement, CI/CD');


INSERT INTO resources (id, title, url, description, type, is_ada, theme_id)
VALUES
(1,'Introduction à React','https://react.dev','Guide officiel React','guide',FALSE,1),
(2,'SQL pour débutants','https://example.com/sql','Cours SQL complet','video',TRUE,3),
(3,'Exercices JavaScript','https://example.com/js','Pratique JS','exercice',TRUE,1),      
(4,'Créer une API en node','https://example.com/node','Projet node','projet',FALSE,2);


INSERT INTO skills (id, name)
VALUES
(1,'JavaScript'),
(2,'React'),
(3,'SQL'),
(4,'PostgreSQL'),
(5,'Node.js');


INSERT INTO resources_skills (resource_id, skill_id)
VALUES
(1,1),
(1,2),
(2,3),
(2,4),
(3,1),
(4,1),
(4,5);