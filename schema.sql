CREATE TABLE Client (
id_client integer not null,
nom text not null,
tel text not null,
email text not null,
primary key (id_client));

CREATE TABLE Categorie (
code_categ integer not null,
description text not null,
primary key(code_categ));

CREATE TABLE hotel (
id_hotel integer not null,
nom text not null,
adresse char(80) not null,
tel text not null,
nombre_etoiles integer CHECK (nombre_etoiles BETWEEN 1 AND 5) not null,
primary key(id_hotel));

CREATE TABLE Tarification (
prix float not null,
code_categ integer not null,
id_hotel integer not null,
primary key(prix,id_hotel,code_categ),
foreign key (code_categ) references Categorie(code_categ),
foreign key (id_hotel) references hotel(id_hotel));

CREATE TABLE Chambre (
numero_chambre_reserv integer not null,
id_hotel integer not null,
code_categ integer not null,
primary key(numero_chambre_reserv, id_hotel),
foreign key(id_hotel) references hotel(id_hotel),
foreign key(code_categ) references Categorie(code_categ));

CREATE TABLE Reservation (
numero_reserv integer not null,
id_client integer not null,
date_debut date not null,
date_fin date not null,
numero_chambre_reserv integer not null,
primary key(numero_reserv, id_client, date_debut, date_fin),
foreign key(numero_chambre_reserv) references Chambre(numero_chambre),
foreign key(id_client) references Client(id_client));