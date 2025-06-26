CREATE TABLE CLIENT (
    id_client CHAR(5),
    nom_prenom_client VARCHAR(80) NOT NULL,
    adresse_facturation_client VARCHAR(50) NOT NULL,
    complement_adresse_facturation_client VARCHAR(50),
    code_postal_facturation_client CHAR(5) NOT NULL,
    commune_facturation_client VARCHAR(50) NOT NULL,
    telephone_client CHAR(10) NOT NULL,
    mail_client VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_client)
);

CREATE TABLE MAISON (
    id_maison CHAR(6),
    adresse_maison VARCHAR(50) NOT NULL,
    complement_adresse_maison VARCHAR(50),
    code_postal_maison CHAR(5) NOT NULL,
    commune_maison VARCHAR(50) NOT NULL,
    isolation_maison CHAR(1) NOT NULL, -- A, B, C...
    Tbase_maison NUMERIC(3, 1) NOT NULL,
    hauteur_plafond_maison NUMERIC(4, 2) NOT NULL,
    puissance_maison NUMERIC(6, 2) NOT NULL,
    id_client CHAR(5) NOT NULL,
    PRIMARY KEY (id_maison),
    FOREIGN KEY (id_client) REFERENCES CLIENT (id_client)
);

CREATE TABLE PIECE (
    id_piece CHAR(5),
    libelle_piece VARCHAR(30) NOT NULL,
    longueur_piece NUMERIC(5, 2) NOT NULL,
    largeur_piece NUMERIC(5, 2) NOT NULL,
    hauteur_piece NUMERIC(4, 2) NOT NULL,
    Tconfort_piece NUMERIC(3, 1) NOT NULL,
    puissance_piece NUMERIC(6, 2) NOT NULL,
    id_maison CHAR(6) NOT NULL,
    PRIMARY KEY (id_piece),
    FOREIGN KEY (id_maison) REFERENCES MAISON (id_maison)
);

CREATE TABLE AUDIT (
    id_audit CHAR(5),
    id_client CHAR(5) NOT NULL,
    id_maison CHAR(6) NOT NULL,
    PRIMARY KEY (id_audit),
    FOREIGN KEY (id_client) REFERENCES CLIENT (id_client),
    FOREIGN KEY (id_maison) REFERENCES MAISON (id_maison)
);