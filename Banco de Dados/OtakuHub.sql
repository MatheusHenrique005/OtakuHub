create database OtakuHub;
use OtakuHub;

CREATE TABLE estudio_editora (
    id_estudio_editora INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    tipo CHAR(7),
    CONSTRAINT chkEstudioEditora CHECK (tipo IN ('estudio' , 'editora'))
);

CREATE TABLE autor (
    id_autor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    biografia VARCHAR(2000),
    dt_nascimento DATE
);

CREATE TABLE anime_manga (
    id_anime_manga INT PRIMARY KEY AUTO_INCREMENT,
    tipo CHAR(5),
    CONSTRAINT chk_anime_manga CHECK (tipo IN ('anime' , 'manga')),
    titulo VARCHAR(50),
    sinopse VARCHAR(2000),
    qdt_capitulos INT,
    lancamento DATE,
    fk_autor INT,
    fk_estudio_editora INT,
    CONSTRAINT fk_autor FOREIGN KEY (fk_autor)
        REFERENCES autor (id_autor),
    CONSTRAINT fk_estudio_editora FOREIGN KEY (fk_estudio_editora)
        REFERENCES estudio_editora (id_estudio_editora)
);

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
    fk_anime_manga INT,
    fk_usuario INT,
    CONSTRAINT fk_anime_manga FOREIGN KEY (fk_anime_manga)
        REFERENCES anime_manga (id_anime_manga),
    CONSTRAINT fk_publicacao_usuario FOREIGN KEY (fk_usuario)
        REFERENCES usuario (id_usuario),
    CONSTRAINT pk_publicacao PRIMARY KEY (id_publicacao , fk_usuario)
);

CREATE TABLE comentario (
    id_comentario INT AUTO_INCREMENT,
    texto VARCHAR(250),
    dt_comentario DATETIME DEFAULT CURRENT_TIMESTAMP,
    fk_publicacao INT,
    fk_usuario INT,
    CONSTRAINT fk_comentario_publicacao FOREIGN KEY (fk_publicacao)
        REFERENCES publicacao (id_publicacao),
    CONSTRAINT fk_comentario_usuario FOREIGN KEY (fk_usuario)
        REFERENCES usuario (id_usuario),
    CONSTRAINT pk_comentario PRIMARY KEY (id_comentario , fk_publicacao , fk_usuario)
);

CREATE TABLE curtida (
    dt_curtida DATETIME DEFAULT CURRENT_TIMESTAMP,
    fk_publicacao INT,
    fk_usuario INT,
    CONSTRAINT fk_curtida_publicacao FOREIGN KEY (fk_publicacao)
        REFERENCES publicacao (id_publicacao),
    CONSTRAINT fk_curtida_usuario FOREIGN KEY (fk_usuario)
        REFERENCES usuario (id_usuario),
    CONSTRAINT pk_comentario PRIMARY KEY (fk_publicacao , fk_usuario)
);


