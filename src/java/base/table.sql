/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/SQLTemplate.sql to edit this template
 */
/**
 * Author:  nykan
 * Created: 8 janv. 2024
 */
CREATE TABLE categorie (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(60)
);

CREATE TABLE style (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(60)
);

CREATE TABLE volume (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(60)
);

CREATE TABLE materiel (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(60),
    prix NUMERIC NOT NULL
);

CREATE TABLE meuble (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    idcategorie INT REFERENCES categorie,
    idstyle INT REFERENCES style
);

CREATE TABLE meuble_vente (
    id SERIAL PRIMARY KEY,
    idmeuble INT REFERENCES meuble,
    idvolume INT REFERENCES volume,
    prixvente NUMERIC
);

CREATE TABLE materiel_meuble (
    id SERIAL PRIMARY KEY,
    idmeuble INT REFERENCES meuble,
    idmateriel INT REFERENCES materiel,
    idvolume INT REFERENCES volume,
    qte NUMERIC
);

CREATE TABLE style_materiel (
    id SERIAL PRIMARY KEY,
    idstyle INT REFERENCES style,
    idmateriel INT REFERENCES materiel
);

CREATE TABLE entree (
    id SERIAL PRIMARY KEY,
    idmateriel INT REFERENCES materiel,
    qte NUMERIC
);

CREATE TABLE sortie (
    id SERIAL PRIMARY KEY,
    idmateriel INT REFERENCES materiel,
    qte NUMERIC
);

CREATE TABLE poste (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(60),
    salaire NUMERIC
);

CREATE TABLE construction_volume (
    id SERIAL PRIMARY KEY,
    idvolume INT REFERENCES volume,
    nbpersonne INT
);

CREATE TABLE construction_style (
    id SERIAL PRIMARY KEY,
    idstyle INT REFERENCES style,
    duree INT
);

CREATE TABLE personne (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(60),
    idposte INT REFERENCES poste,
    dateembauche DATE NOT NULL
);

CREATE TABLE experience (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(60),
    anneemin INT,
    anneemax INT,
    salairemulti NUMERIC
);

CREATE TABLE volume_personne (
    id SERIAL PRIMARY KEY,
    idvolume INT REFERENCES volume,
    idpersonne INT REFERENCES personne
);

CREATE TABLE client (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(60),
    prenom VARCHAR(60),
    genre INT
);

CREATE TABLE vente (
    id SERIAL PRIMARY KEY,
    idclient INT REFERENCES client,
    idmeuble INT REFERENCES meuble,
    idvolume INT REFERENCES volume,
    datevente DATE,
    qte NUMERIC
);

CREATE VIEW v_style_materiel (
    idstyle_materiel,
    idstyle,
    nomstyle,
    idmateriel,
    nommateriel
) AS (
    SELECT
        ms.id,
        s.id,
        s.nom,
        m.id,
        m.nom
    FROM
        style_materiel ms
    JOIN
        style s ON s.id = ms.idstyle
    JOIN
        materiel m ON m.id = ms.idmateriel
);

CREATE VIEW v_materiel_meuble (
    idmateriel_meuble,
    idmeuble,
    nommeuble,
    idmateriel,
    nommateriel,
    prix,
    qte,
    idvolume,
    nomvolume,
    somme
) AS (
    SELECT
        m.id,
        me.id,
        me.nom,
        ma.id,
        ma.nom,
        ma.prix,
        m.qte,
        v.id,
        v.nom,
        (m.qte*ma.prix)
    FROM
        materiel_meuble m
    JOIN
        meuble me ON me.id = m.idmeuble
    JOIN
        materiel ma ON ma.id = m.idmateriel
    JOIN
        volume v ON v.id = m.idvolume
);

CREATE VIEW v_meuble_prix (
    idmeuble,
    nommeuble,
    idvolume,
    nomvolume,
    sommefinale
) AS (
    SELECT
        idmeuble,
        nommeuble,
        idvolume,
        nomvolume,
        sum(somme) AS sommefinale
    FROM
        v_materiel_meuble
    GROUP BY
        idmeuble, nommeuble, idvolume, nomvolume
);

CREATE OR REPLACE VIEW v_etat_stock AS
    SELECT
        m.id as idmateriel,
        m.nom as nommateriel,
        COALESCE(sum(e.qte), 0) as sommeEntree,
        COALESCE(sum(s.qte), 0) as sommeSortie,
        (COALESCE(sum(e.qte), 0) - COALESCE(sum(s.qte), 0)) as reste
    FROM
        materiel m
    LEFT JOIN
        entree e ON m.id = e.idmateriel
    LEFT JOIN 
        sortie s ON m.id = s.idmateriel
    GROUP BY
        m.id, m.nom;


CREATE VIEW v_personne_poste (
    idpersonne,
    nompersonne,
    idposte,
    nomposte,
    salaire,
    dateembauche
) AS (
    SELECT
        p.id,
        p.nom,
        s.id,
        s.nom,
        s.salaire,
        p.dateembauche
    FROM
        personne p
    JOIN
        poste s ON s.id = p.idposte
);

-- CREATE VIEW v_salaires AS
--     SELECT
--         vp.idvolume,
--         cs.idstyle,
--         SUM(po.salaire * cs.duree) AS salaire_total
--     FROM
--         volume_personne vp
--     JOIN
--         construction_style cs ON vp.idpersonne = cs.id
--     JOIN
--         personne p ON vp.idpersonne = p.id
--     JOIN
--         poste po ON po.id = p.idposte
--     GROUP BY
--         vp.idvolume, cs.idstyle;

CREATE OR REPLACE VIEW v_salaires AS
    SELECT
        v.id AS idvolume,
        cs.id AS idstyle,
        COALESCE(SUM(p.salaire * cs.duree), 0) AS salaire_total
    FROM
        volume v
    CROSS JOIN
        construction_style cs
    LEFT JOIN
        volume_personne vp ON v.id = vp.idvolume
    LEFT JOIN
        personne pe ON vp.idpersonne = pe.id
    LEFT JOIN
        poste p ON pe.idposte = p.id
    GROUP BY
        v.id, cs.id;



-- CREATE VIEW v_benefice (
--     idmeuble,
--     idvolume,
--     prixvente,
--     prixrevient,
--     benefice
-- ) AS (
--     SELECT 
--         m.id,
--         mv.idvolume,
--         mv.prixvente,
--         (vmp.sommefinale + vs.salaire_total),
--         (mv.prixvente - (vmp.sommefinale + vs.salaire_total))
--     FROM
--         meuble_vente mv
--     JOIN
--         v_meuble_prix vmp ON vmp.idmeuble = mv.idmeuble
--                         AND vmp.idvolume = mv.idvolume
--     JOIN
--         meuble m ON m.id = mv.idmeuble
--     JOIN
--         v_salaires vs ON vs.idvolume = mv.idvolume
--                     AND vs.idstyle = m.idstyle
--     GROUP BY m.id, mv.idvolume
-- );

CREATE OR REPLACE VIEW v_benefice AS
    SELECT 
        m.id AS idmeuble,
        m.nom AS nommeuble,
        v.id as idvolume,
        v.nom as nomvolume,
        mv.prixvente,
        (vmp.sommefinale + COALESCE(vs.salaire_total, 0)) AS couttotal,
        (mv.prixvente - (vmp.sommefinale + COALESCE(vs.salaire_total, 0))) AS benefice
    FROM
        meuble_vente mv
    JOIN
        v_meuble_prix vmp ON vmp.idmeuble = mv.idmeuble
                        AND vmp.idvolume = mv.idvolume
    JOIN
        meuble m ON m.id = mv.idmeuble
    JOIN
        volume v ON v.id = mv.idvolume
    LEFT JOIN
        v_salaires vs ON vs.idvolume = mv.idvolume
                    AND vs.idstyle = m.idstyle
    GROUP BY m.id, v.id, mv.prixvente, vmp.sommefinale, vs.salaire_total;

CREATE VIEW v_personne_experience (
    idpersonne,
    nompersonne,
    dateembauche,
    idposte,
    nomposte,
    salaireexp,
    idexperience,
    nomexperience
) AS (
    SELECT
        p.id,
        p.nom,
        p.dateembauche,
        po.id,
        po.nom,
        (po.salaire * e.salairemulti),
        e.id,
        e.nom
    FROM 
        personne p
    JOIN
        poste po ON p.idposte = po.id
    LEFT JOIN
        experience e ON EXTRACT(YEAR FROM age(CURRENT_DATE, p.dateembauche)) BETWEEN e.anneemin AND e.anneemax
);

-- CREATE VIEW v_statistique (
--     idmeuble,
--     nommeuble,
--     idvolume,
--     nomvolume,
--     datevente,
--     quantite,
--     genre
-- ) AS (
--     SELECT m.id, m.nom, vo.id, vo.nom, EXTRACT(MONTH FROM v.datevente), SUM(v.qte), c.genre
--     FROM vente v
--     JOIN meuble_vente mv ON v.idmeuble = mv.idmeuble AND v.idvolume = mv.idvolume
--     JOIN meuble m ON m.id = v.idmeuble
--     JOIN volume vo ON vo.id = v.idvolume
--     JOIN client c ON c.id = v.idclient
--     GROUP BY m.id, vo.id, c.genre, EXTRACT(MONTH FROM v.datevente)
-- );

-- CREATE VIEW v_statistique_meuble (
--     idmeuble,
--     nommeuble,
--     idvolume,
--     nomvolume,
--     datevente,
--     quantite,
--     genre
-- ) AS (
--     SELECT 1, 'tous les meubles', vo.id, vo.nom, EXTRACT(MONTH FROM v.datevente), SUM(v.qte), c.genre
--     FROM vente v
--     JOIN meuble_vente mv ON v.idmeuble = mv.idmeuble AND v.idvolume = mv.idvolume
--     JOIN volume vo ON vo.id = v.idvolume
--     JOIN client c ON c.id = v.idclient
--     GROUP BY vo.id, c.genre, EXTRACT(MONTH FROM v.datevente)
-- );


-- CREATE OR REPLACE VIEW v_statistique (
--     idmeuble,
--     nommeuble,
--     idvolume,
--     nomvolume,
--     datevente,
--     annee,
--     quantite,
--     genre
-- ) AS (
--     SELECT
--         m.id AS idmeuble,
--         m.nom AS nommeuble,
--         vo.id AS idvolume,
--         vo.nom AS nomvolume,
--         mois.m AS datevente,
-- 		COALESCE(EXTRACT(YEAR FROM v.datevente), 0) as annee,
--         COALESCE(SUM(v.qte), 0) AS quantite,
--         c.genre
--     FROM
--         (SELECT generate_series(1, 12) AS m) mois
--     CROSS JOIN
--         meuble m
--     CROSS JOIN
--         volume vo
--     CROSS JOIN
--         client c
--     LEFT JOIN
--         vente v ON m.id = v.idmeuble
--                 AND vo.id = v.idvolume
--                 AND c.id = v.idclient
--                 AND EXTRACT(MONTH FROM v.datevente) = mois.m
--     GROUP BY
--         m.id, m.nom, vo.id, vo.nom, mois.m, EXTRACT(YEAR FROM v.datevente), c.genre
--     ORDER BY
--         m.id, vo.id, mois.m
-- );

CREATE OR REPLACE VIEW v_statistique (
    idmeuble,
    nommeuble,
    idvolume,
    nomvolume,
    datevente,
    annee,
    quantite_homme,
    quantite_femme
) AS (
    SELECT
        m.id AS idmeuble,
        m.nom AS nommeuble,
        vo.id AS idvolume,
        vo.nom AS nomvolume,
        mois.m AS datevente,
        COALESCE(EXTRACT(YEAR FROM v.datevente), 0) as annee,
        COALESCE(SUM(CASE WHEN c.genre = 1 THEN v.qte ELSE 0 END), 0) AS quantite_homme,
        COALESCE(SUM(CASE WHEN c.genre = 11 THEN v.qte ELSE 0 END), 0) AS quantite_femme
    FROM
        (SELECT generate_series(1, 12) AS m) mois
    CROSS JOIN
        meuble m
    CROSS JOIN
        volume vo
    CROSS JOIN
        client c
    LEFT JOIN
        vente v ON m.id = v.idmeuble
                AND vo.id = v.idvolume
                AND c.id = v.idclient
                AND EXTRACT(MONTH FROM v.datevente) = mois.m
    GROUP BY
        m.id, m.nom, vo.id, vo.nom, mois.m, EXTRACT(YEAR FROM v.datevente)
    ORDER BY
        m.id, vo.id, mois.m
);

CREATE OR REPLACE VIEW v_statistique_meuble (
    idmeuble,
    nommeuble,
    idvolume,
    nomvolume,
    datevente,
    annee,
    quantite_homme,
    quantite_femme
) AS (
    SELECT
        1 AS idmeuble,
        'tous les meubles' AS nommeuble,
        vo.id AS idvolume,
        vo.nom AS nomvolume,
        mois.m AS datevente,
        COALESCE(EXTRACT(YEAR FROM v.datevente), 0) as annee,
        COALESCE(SUM(CASE WHEN c.genre = 1 THEN v.qte ELSE 0 END), 0) AS quantite_homme,
        COALESCE(SUM(CASE WHEN c.genre = 11 THEN v.qte ELSE 0 END), 0) AS quantite_femme
    FROM
        (SELECT generate_series(1, 12) AS m) mois
    CROSS JOIN
        volume vo
    CROSS JOIN
        client c
    LEFT JOIN
        vente v ON vo.id = v.idvolume
                AND c.id = v.idclient
                AND EXTRACT(MONTH FROM v.datevente) = mois.m
    GROUP BY
        vo.id, vo.nom, mois.m, EXTRACT(YEAR FROM v.datevente)
    ORDER BY
        vo.id, mois.m
);


-- CREATE OR REPLACE VIEW v_statistique_meuble (
--     idmeuble,
--     nommeuble,
--     idvolume,
--     nomvolume,
--     datevente,
--     annee,
--     quantite,
--     genre
-- ) AS (
--     SELECT
--         1 AS idmeuble,
--         'tous les meubles' AS nommeuble,
--         vo.id AS idvolume,
--         vo.nom AS nomvolume,
--         mois.m AS datevente,
--         COALESCE(EXTRACT(YEAR FROM v.datevente), 0) as annee,
--         COALESCE(SUM(v.qte), 0) AS quantite,
--         c.genre
--     FROM
--         (SELECT generate_series(1, 12) AS m) mois
--     CROSS JOIN
--         volume vo
--     CROSS JOIN
--         client c
--     LEFT JOIN
--         vente v ON vo.id = v.idvolume
--                 AND c.id = v.idclient
--                 AND EXTRACT(MONTH FROM v.datevente) = mois.m
--     GROUP BY
--         vo.id, vo.nom, mois.m, EXTRACT(YEAR FROM v.datevente), c.genre
--     ORDER BY
--         vo.id, mois.m
-- );