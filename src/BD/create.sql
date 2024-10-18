create table TERRAINS(
    numTerrains int PRIMARY KEY,
    nom VARCHAR(32),
    nomCat varchar(32)
);

create table CATEGORIE(
    nomCat VARCHAR(32) PRIMARY KEY
);

create table PERSONNE(
    idPersonne int PRIMARY KEY,
    nomPersonne VARCHAR(32),
    prenomPersonne VARCHAR(32),
    poidsPersonne float,
    estMoniteur Boolean,
    MDP VARCHAR(32),
    emailPersonne VARCHAR(32),
    estAbonne Boolean
);

create table PONEYS(
    idPoney int PRIMARY KEY,
    nomPoney VARCHAR(32),
    poidsMax float,
    DdNPoney date,
    taillePoney float
);


create table RESERVER(
    idPersonne int,
    JourHeure Datetime,
    idPoney int,
    idCours int, 
    PRIMARY KEY(idPersonne, JourHeure, idPoney),
    UNIQUE(idPersonne, JourHeure, idPoney, idCours)
);


create  table COURS(
    idCours int PRIMARY KEY,
    estParticulier Boolean,
    duree float,
    prix float,
    nomCat VARCHAR(32),
    numTerrains int,
    idPersonne int
);

ALTER TABLE TERRAINS ADD FOREIGN KEY (nomCat) REFERENCES CATEGORIE (nomCat);
ALTER TABLE RESERVER ADD FOREIGN KEY (idPersonne) REFERENCES PERSONNE (idPersonne);
ALTER TABLE RESERVER ADD FOREIGN KEY (idPoney) REFERENCES PONEYS (idPoney);
ALTER TABLE RESERVER ADD FOREIGN KEY (idCours) REFERENCES COURS (idCours);
ALTER TABLE COURS ADD FOREIGN KEY (nomCat) REFERENCES CATEGORIE (nomCat);
ALTER TABLE COURS ADD FOREIGN KEY (numTerrains) REFERENCES TERRAINS (numTerrains);
ALTER TABLE COURS ADD FOREIGN KEY (idPersonne) REFERENCES PERSONNE (idPersonne);
ALTER TABLE TERRAINS ADD FOREIGN KEY (nomCat) REFERENCES CATEGORIE (nomCat);