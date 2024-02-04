/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/SQLTemplate.sql to edit this template
 */
/**
 * Author:  nykan
 * Created: 8 janv. 2024
 */

INSERT INTO categorie (nom) VALUES 
    ('Chaise'),
    ('Table'),
    ('Armoire'),
    ('Bureau'),
    ('Canapé');

-- Insertion des données dans la table 'style'
INSERT INTO style (nom) VALUES 
    ('Royale'),
    ('Moderne'),
    ('Contemporain');

-- Insertion des données dans la table 'volume'
INSERT INTO volume (nom) VALUES 
    ('PM'),
    ('MM'),
    ('GM');

-- Insertion des données dans la table 'matiere'
INSERT INTO materiel (nom, prix) VALUES 
    ('Bois', 400),
    ('Plastique', 500),
    ('Métal', 300),
    ('Cuir', 450),
    ('Verre', 600);


INSERT INTO meuble (nom, idcategorie, idstyle) VALUES
('Canape royal'	,5,	1),
('Chaise moderne',	1,	2),
('Table Contemporain', 2, 3);

INSERT INTO meuble_vente (idmeuble, idvolume, prixvente) VALUES
(1, 1,	1000),
(1,	2,	2000),
(1,	3,	4000),

(2, 1,	700),
(2,	2,	1000),
(2,	3,	3000),

(3, 1,	500),
(3,	2,	1000),
(3,	3,	2500);

INSERT INTO materiel_meuble (idmeuble, idmateriel, idvolume, qte) VALUES
(1, 2, 1, 5.0),
(1, 3, 1, 10.0),
(1, 4, 1, 5.0),
(1, 2, 2, 15.0),
(1, 3, 2, 20.0),
(1, 4, 2, 10.0);

INSERT INTO materiel_meuble (idmeuble, idmateriel, idvolume, qte) VALUES
(2, 2, 1, 12.0),
(2, 3, 1, 9.0),
(2, 2, 2, 20.0),
(2, 3, 2, 15.0);

INSERT INTO style_materiel (idstyle, idmateriel) VALUES
(3, 1),
(3, 4),
(3, 5),
(1, 2),
(1, 3),
(1, 4),
(2, 2),
(2, 3);

INSERT INTO entree (idmateriel, qte) VALUES
(1, 15.0),
(1, 30.0),
(2, 20.0),
(5, 10.0);

INSERT INTO sortie (idmateriel, qte) VALUES
(1, 15.0),
(2, 20.0),
(5, 10.0);

-- Insertion de données dans la table "poste"
INSERT INTO poste (nom, salaire) VALUES
    ('Manager', 50000.00),
    ('Développeur', 40000.00),
    ('Designer', 45000.00),
    ('Analyste financier', 55000.00);

-- Insertion de données dans la table "personne"
INSERT INTO personne (nom, idposte, dateembauche) VALUES
    ('Eva', 2, '2017-03-20'),
    ('Frank', 1, '2022-05-10'),
    ('Grace', 3, '2019-08-15'),
    ('Henry', 4, '2015-01-02'),
    ('Isabel', 1, '2020-12-18'),
    ('Jack', 3, '2018-06-25'),
    ('Karen', 2, '2020-10-05'),
    ('Louis', 4, '2022-03-12');

INSERT INTO experience (nom, anneemin, anneemax, salairemulti) VALUES
    ('ouvrier', 0, 2, 1),
    ('expert', 3, 4, 2),
    ('senior', 5, 10, 3);

INSERT INTO client (nom, prenom, genre) VALUES
    ('Dupont', 'Jean', 1),
    ('Martin', 'Paul', 1),
    ('Dubois', 'Jacques', 1),
    ('Durand', 'Marie', 11),
    ('Lefevre', 'Sophie', 11),
    ('Leroy', 'Pierre', 1),
    ('Moreau', 'Julie', 11),
    ('Girard', 'Thomas', 1),
    ('Bonnet', 'Laura', 11),
    ('Roux', 'Alexandre', 1);

INSERT INTO construction_style (idstyle, duree) VALUES
    (1, 3),
    (2, 2),
    (3, 2);

INSERT INTO construction_volume (idvolume, nbpersonne) VALUES
    (1, 2),
    (2, 4),
    (3, 8);

INSERT INTO volume_personne (idvolume, idpersonne) VALUES
    (1, 3),
    (1, 1),

    (2, 6),
    (2, 5),
    (2, 2),
    (2, 4),

    (3, 8),
    (3, 7),
    (3, 2),
    (3, 1),
    (3, 4),
    (3, 3),
    (3, 5),
    (3, 6);

INSERT INTO vente (idclient, idmeuble, idvolume, datevente, qte) VALUES
-- Janvier
(2, 2, 2, '2024-01-10', 20.0),
(1, 2, 2, '2024-01-10', 15.0),
(4, 2, 2, '2024-01-10', 50.0),
(7, 2, 2, '2024-01-10', 10.0),
(9, 1, 2, '2024-01-10', 60.0),
(8, 1, 2, '2024-01-10', 30.0),
(8, 1, 2, '2024-01-10', 29.0)
-- Février
(3, 1, 2, '2024-02-10', 25.0),
(6, 2, 2, '2024-02-10', 18.0),
(5, 2, 2, '2024-02-10', 35.0),
(10, 1, 2, '2024-02-10', 22.0),
(3, 2, 2, '2024-02-10', 15.0),
-- Mars
(4, 1, 2, '2024-03-10', 40.0),
(9, 2, 2, '2024-03-10', 12.0),
(7, 2, 2, '2024-03-10', 28.0),
(6, 1, 2, '2024-03-10', 45.0),
(10, 2, 2, '2024-03-10', 20.0),
-- Avril
(5, 1, 2, '2024-04-10', 30.0),
(8, 2, 2, '2024-04-10', 25.0),
(3, 2, 2, '2024-04-10', 18.0),
(9, 1, 2, '2024-04-10', 50.0),
(4, 1, 2, '2024-04-10', 35.0),
-- Mai
(6, 1, 2, '2024-05-10', 22.0),
(10, 2, 2, '2024-05-10', 15.0),
(7, 2, 2, '2024-05-10', 40.0),
(8, 1, 2, '2024-05-10', 28.0),
(5, 2, 2, '2024-05-10', 10.0),
-- Juin
(3, 1, 2, '2024-06-10', 18.0),
(6, 2, 2, '2024-06-10', 30.0),
(4, 2, 2, '2024-06-10', 25.0),
(9, 1, 2, '2024-06-10', 15.0),
(10, 2, 2, '2024-06-10', 35.0),
-- Juillet
(5, 1, 2, '2024-07-10', 40.0),
(8, 2, 2, '2024-07-10', 18.0),
(3, 2, 2, '2024-07-10', 22.0),
(7, 1, 2, '2024-07-10', 28.0),
(4, 1, 2, '2024-07-10', 10.0),
-- Août
(10, 2, 2, '2024-08-10', 50.0),
(9, 1, 2, '2024-08-10', 15.0),
(6, 2, 2, '2024-08-10', 30.0),
(5, 2, 2, '2024-08-10', 25.0),
(8, 1, 2, '2024-08-10', 18.0),
-- Septembre
(3, 1, 2, '2024-09-10', 28.0),
(7, 2, 2, '2024-09-10', 22.0),
(4, 2, 2, '2024-09-10', 40.0),
(9, 1, 2, '2024-09-10', 10.0),
(10, 2, 2, '2024-09-10', 35.0),
-- Octobre
(6, 1, 2, '2024-10-10', 18.0),
(5, 2, 2, '2024-10-10', 30.0),
(8, 2, 2, '2024-10-10', 25.0),
(3, 1, 2, '2024-10-10', 40.0),
(7, 1, 2, '2024-10-10', 15.0),
-- Novembre
(9, 1, 2, '2024-11-10', 22.0),
(4, 2, 2, '2024-11-10', 18.0),
(10, 2, 2, '2024-11-10', 30.0),
(6, 1, 2, '2024-11-10', 35.0),
(5, 2, 2, '2024-11-10', 28.0),
-- Décembre
(8, 1, 2, '2024-12-10', 25.0),
(7, 2, 2, '2024-12-10', 40.0),
(3, 2, 2, '2024-12-10', 15.0),
(6, 1, 2, '2024-12-10', 10.0),
(9, 1, 2, '2024-12-10', 50.0);
