drop database if exists applicazione;
create database applicazione;
use applicazione;

crate table Anni(
	id int auto_increment not null,
	numero varchar (30) not null,
	primary key (id)
)engine=innodb;

create table Classi(
	id int auto_increment not null,
	sezione varchar (30) not null,
	primary key (id),
	foreign key(idAnni) references Anni(idAnni)
)engine=innodb;

create table Studenti(
	id int auto_increment not null,
	nome varchar(30) not null,
	cognome varchar(30) not null,
	data_nascita varchar(30) not null,
	e-mail varchar(30) not null,
	num_tel varchar(30) not null,
	primary key (id),
	foreign key(idClassi) references Classi(idClassi)
)engine=innodb;

create table Professori(
	id int auto_increment not null,
	nome varchar(30) not null,
	cognome varchar(30) not null,
	nomeUtente varchar(30) not null,
	password varchar(30) not null,
	primary key (id)
)engine= innodb;

create table Note(
	id int auto_increment not null,
	testo varchar(30) not null,
	primary key (id),
	foreign key(idStudenti) references Studenti(idStudenti)
		on update cascade,
	foreign key(idProfessori) references Professori(idProfessori)
		on update cascade
)engine=innodb;
