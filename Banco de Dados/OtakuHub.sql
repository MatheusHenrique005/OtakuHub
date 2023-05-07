create database OtakuHub;
use OtakuHub;

CREATE TABLE usuario (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(150),
    nick VARCHAR(45),
    dtNasc DATE,
    email VARCHAR(150),
    senha VARCHAR(45)
);

CREATE TABLE publicacao (
    id_publicacao INT NOT NULL AUTO_INCREMENT,
    imagem VARCHAR(150),
    titulo VARCHAR(45),
    texto VARCHAR(1500),
    dt_publicacao DATETIME DEFAULT CURRENT_TIMESTAMP,
    fk_usuario INT,
    CONSTRAINT fk_publicacao_usuario FOREIGN KEY (fk_usuario)
        REFERENCES usuario (id_usuario),
    CONSTRAINT pk_publicacao PRIMARY KEY (id_publicacao , fk_usuario)
);

CREATE TABLE comentario (
    id_comentario INT PRIMARY KEY AUTO_INCREMENT,
    texto VARCHAR(250),
    dt_comentario DATETIME DEFAULT CURRENT_TIMESTAMP,
    fk_publicacao INT,
    fk_usuario INT,
    CONSTRAINT fk_comentario_publicacao FOREIGN KEY (fk_publicacao)
        REFERENCES publicacao (id_publicacao),
    CONSTRAINT fk_comentario_usuario FOREIGN KEY (fk_usuario)
        REFERENCES usuario (id_usuario)
);

CREATE TABLE curtida (
    id_curtida INT PRIMARY KEY AUTO_INCREMENT,
    dt_curtida DATETIME DEFAULT CURRENT_TIMESTAMP,
    fk_publicacao INT,
    fk_usuario INT,
    CONSTRAINT fk_curtida_publicacao FOREIGN KEY (fk_publicacao)
        REFERENCES publicacao (id_publicacao),
    CONSTRAINT fk_curtida_usuario FOREIGN KEY (fk_usuario)
        REFERENCES usuario (id_usuario)
);

CREATE TABLE estudio_editora (
    id_estudio_editora INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    tipo CHAR(7),
    CONSTRAINT chkEstudioEditora CHECK (tipo IN ('estudio' , 'editora'))
);


CREATE TABLE anime_manga (
    id_anime_manga INT PRIMARY KEY AUTO_INCREMENT,
    tipo CHAR(5),
    CONSTRAINT chk_anime_manga CHECK (tipo IN ('anime' , 'manga')),
    titulo VARCHAR(50),
    sinopse VARCHAR(2000),
    qdt_capitulos INT,
    lancamento DATE,
    fk_estudio_editora VARCHAR(45),
    CONSTRAINT fk_estudio_editora FOREIGN KEY (fk_estudio_editora)
        REFERENCES estudio_editora (id_estudio_editora)
);



