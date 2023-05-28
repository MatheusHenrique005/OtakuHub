var database = require("../database/config")

function publicar(idUsuario, titulo, conteudo, imagem) {
    console.log("Model publicar, ok");

    var instrucao = `
        INSERT INTO publicacao VALUES
        (null, '${imagem}', '${titulo}', '${conteudo}', DEFAULT, ${idUsuario});
    `;

    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function listar_publicacoes(){
    console.log("Model listar publicações, ok");

    var instrucao = `
        SELECT * FROM publicacao
            JOIN usuario ON id_usuario = fk_usuario;
    `;

    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

module.exports = {
    publicar,
    listar_publicacoes
}