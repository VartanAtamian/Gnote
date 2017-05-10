CREATE TABLE eleve(

	id_eleve INTEGER PRIMARY KEY,
	prenom VARCHAR(15),
	nom VARCHAR(15),
	email VARCHAR(30)
);

CREATE TABLE enseignant(

	id_prof INTEGER PRIMARY KEY,
	prenom VARCHAR(15),
	nom VARCHAR(15),
	email VARCHAR(30)
);

CREATE TABLE matiere(
	id_matiere INTEGER PRIMARY KEY,
	titre VARCHAR(20),
	epreuve INTEGER,
	etudiant INTEGER ,
	FOREIGN KEY (epreuve) REFERENCES epreuve(id_epreuve),
	FOREIGN KEY (etudiant) REFERENCES eleve(id_eleve)
);

CREATE TABLE epreuve(
	id_epreuve INTEGER PRIMARY KEY,
	titre VARCHAR (20)
);
