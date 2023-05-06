create database OtakuHub;
use OtakuHub;

create table anime(
	id_anime int primary key auto_increment,
    titulo varchar(50),
    sinopse varchar(2000),
    qdt_capitulos int,
    lancamento date,
	estudio varchar(45)    
);

create table manga(
	id_manga int primary key auto_increment,
    titulo varchar(50),
    sinopse varchar(2000),
    qtd_capitulos int,
    lancamento date,
    autor varchar(45),
    editora varchar(45)
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