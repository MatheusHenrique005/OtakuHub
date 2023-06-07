var database = require("../database/config")

function listar() {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function listar()");
    var instrucao = `
        SELECT * FROM usuario;
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function entrar(email, senha) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function entrar(): ", email, senha)
    var instrucao = `
        SELECT *,
            DATE_FORMAT(dtNasc, '%d-%m') as 'aniversario',
            timestampdiff(year, dtNasc, now()) as 'idade'
        FROM usuario
        WHERE email = '${email}'
            AND senha = SHA2('${senha}', 256);
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

// Coloque os mesmos parâmetros aqui. Vá para a var instrucao
function cadastrar(nome, nick, nascimento, email, senha) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():", nome, email, senha);
    
    // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
    //  e na ordem de inserção dos dados.
    var instrucao = `
        INSERT INTO usuario (nome, nick, dtNasc, email, senha) VALUES ('${nome}','${nick}', '${nascimento}', '${email}', SHA2('${senha}', 256));
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function atualizar_perfil(foto, id_usuario, nick, nome, email){
    var instrucao = `
        UPDATE usuario
        SET nome = '${nome}',
            nick = '${nick}',
            email = '${email}',
            foto_perfil = '${foto}'
        WHERE id_usuario = ${id_usuario};
    `;

    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function seguir(seguido, seguidor){
    var instrucao = `
        INSERT INTO seguidores VALUES
        (${seguido}, ${seguidor});
    `;

    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function mostrar_seguidores() {
    var instrucao = `
        SELECT nick,
            count(fk_seguidor) as 'seguidores'
        FROM seguidores
            JOIN usuario ON fk_seguido = id_usuario
        GROUP BY id_usuario
        ORDER BY seguidores DESC;
    `;

    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function verificar_seguindo(id_publicador, id_usuario){
    var instrucao = `
        SELECT *
        FROM seguidores
        WHERE fk_seguido = ${id_publicador}
            AND fk_seguidor = ${id_usuario};
    `;

    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

module.exports = {
    entrar,
    cadastrar,
    listar,
    atualizar_perfil,
    seguir,
    mostrar_seguidores,
    verificar_seguindo
};