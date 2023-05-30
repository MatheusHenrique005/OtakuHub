CREATE DATABASE OtakuHub;
USE OtakuHub;

CREATE TABLE usuario (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(150),
    nick VARCHAR(45),
    dtNasc DATE,
    email VARCHAR(150),
    senha VARCHAR(45)
);

CREATE TABLE anime_manga(
    id_anime_manga INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    sinopse VARCHAR(5000),
    autor VARCHAR(45),
    genero VARCHAR(45)
);

CREATE TABLE votacao (
    fk_usuario INT,
    fk_anime_manga INT,
    CONSTRAINT fk_votacao_anime_manga FOREIGN KEY (fk_anime_manga) REFERENCES anime_manga (id_anime_manga),
    CONSTRAINT fk_votacao_usuario FOREIGN KEY (fk_usuario) REFERENCES usuario (id_usuario),
    CONSTRAINT pk_votacao PRIMARY KEY (fk_usuario, fk_anime_manga)
);

CREATE TABLE publicacao (
    id_publicacao INT NOT NULL AUTO_INCREMENT,
    imagem VARCHAR(150),
    titulo VARCHAR(45),
    conteudo VARCHAR(1500),
    dt_publicacao DATETIME DEFAULT CURRENT_TIMESTAMP,
    fk_usuario INT,
    CONSTRAINT fk_publicacao_usuario FOREIGN KEY (fk_usuario) REFERENCES usuario (id_usuario),
    CONSTRAINT pk_publicacao PRIMARY KEY (id_publicacao, fk_usuario)
);

CREATE TABLE comentario (
    id_comentario INT AUTO_INCREMENT,
    texto VARCHAR(250),
    dt_comentario DATETIME DEFAULT CURRENT_TIMESTAMP,
    fk_publicacao INT,
    fk_usuario INT,
    CONSTRAINT fk_comentario_publicacao FOREIGN KEY (fk_publicacao) REFERENCES publicacao (id_publicacao),
    CONSTRAINT fk_comentario_usuario FOREIGN KEY (fk_usuario) REFERENCES usuario (id_usuario),
    CONSTRAINT pk_comentario PRIMARY KEY (id_comentario, fk_publicacao, fk_usuario)
);

CREATE TABLE curtida (
    dt_curtida DATETIME DEFAULT CURRENT_TIMESTAMP,
    fk_publicacao INT,
    fk_usuario INT,
    CONSTRAINT fk_curtida_publicacao FOREIGN KEY (fk_publicacao) REFERENCES publicacao (id_publicacao),
    CONSTRAINT fk_curtida_usuario FOREIGN KEY (fk_usuario) REFERENCES usuario (id_usuario),
    CONSTRAINT pk_comentario PRIMARY KEY (fk_publicacao, fk_usuario)
);

DELIMITER $$
CREATE FUNCTION fun_votar
(id_usuario INT, id_anime_manga INT)
RETURNS INT(1) DETERMINISTIC
BEGIN
DECLARE voto_existente INT(1) DEFAULT 0;
SET voto_existente = IFNULL(
        (
            SELECT DISTINCT 1
            FROM votacao
            WHERE fk_usuario = id_usuario
                AND fk_anime_manga = id_anime_manga
        ),
        0
);
RETURN voto_existente;
END 
$$;

DELIMITER $$
CREATE PROCEDURE sp_votar(id_usuario INT, id_anime_manga INT)
BEGIN
DECLARE voto INT(1) DEFAULT 0;
SET voto = fun_votar(id_usuario, id_anime_manga);
	if voto = 0 then
		insert into votacao values
			(id_usuario, id_anime_manga);
	end if;
		
END
$$

call sp_votar(2, 1);


SELECT * FROM publicacao
            JOIN usuario ON id_usuario = fk_usuario
        WHERE id_usuario = 5
        ORDER BY id_publicacao;