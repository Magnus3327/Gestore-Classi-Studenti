drop database if exists applicazione;
create database applicazione;
use applicazione;

create table Studenti (
    id INT auto_increment NOT NULL,
    nome VARCHAR(30) NOT NULL,
	cognome VARCHAR(30) NOT NULL,
	foto VARCHAR(30) NOT NULL,
	e-mail VARCHAR(30),
	numeroTelefono VARCHAR(30),
	note VARCHAR(60)
    PRIMARY KEY (id)
)engine=innodb;

create table Classi(
    id INT auto_increment NOT NULL,
    lettera VARCHAR(30) NOT NULL,
	sezione VARCHAR(30) NOT NULL,
	anno INT NOT NULL,
	note VARCHAR(60) NOT NULL,
    PRIMARY KEY (id)
)engine=innodb;

create table StudentiSonoClassi (		
    id INT auto_increment NOT NULL,
    idStudente INT NOT NULL DEFAULT 1,
    idClasse INT NOT NULL DEFAULT 1,
    PRIMARY KEY (id),
    FOREIGN KEY (idStudente) REFERENCES Studenti(id)
		on update CASCADE, 
		/*on delete no action*/		
	FOREIGN KEY (idClasse) REFERENCES Classi(id)
		on update CASCADE 
		/*on delete no action*/
)engine=innodb;