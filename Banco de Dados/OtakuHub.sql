create database OtakuHub;
use OtakuHub;

create table anime_manga(
	id_anime int primary key auto_increment,
    tipo char(5),
    constraint chkTipo check (tipo in('anime', 'manga')),
    titulo varchar(50),
    qdt_capitulos int,
    sinopse varchar(2000)
);

create table usuario(
	id_usuario int primary key auto_increment,
    nome varchar(150),
    nick varchar(45),
    dtNasc date,
    sexo char(1),
    constraint chkSexo check (sexo in('m', 'f', 'n')),
    email varchar(150),
    senha varchar(45)
);