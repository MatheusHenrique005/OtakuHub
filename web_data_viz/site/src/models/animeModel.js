var database = require("../database/config");

function cadastrar_anime(foto, nome, autor, genero, sinopse){
    console.log("cadastrar_anime model, ok");

    var instrucao = `
        INSERT INTO anime_manga (nome, sinopse, autor, genero, foto_capa) 
        VALUES ('${nome}', '${sinopse}', '${autor}' , '${genero}', '${foto}')
    `;

    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function todos_animes(){
    console.log("listar todos_animes, ok")

    var instrucao = `
        SELECT * FROM anime_manga
    `;
    
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

module.exports = {
    cadastrar_anime,
    todos_animes
}