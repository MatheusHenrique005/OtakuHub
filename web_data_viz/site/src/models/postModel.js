var database = require("../database/config")

function publicar(idUsuario, titulo, conteudo, imagem) {
    console.log("Model publicar, ok")

    var instrucao = `
        INSERT INTO publicacao VALUES
        (null, '${imagem}', '${titulo}', '${conteudo}', DEFAULT, ${idUsuario});
    `;

    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

module.exports = {
    publicar
}