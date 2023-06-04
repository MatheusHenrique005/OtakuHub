var animeModel = require("../models/animeModel");

function cadastrar_anime(req, res) {

    const foto = req.file.filename;
    var nome = req.body.nome;
    var autor = req.body.autor;
    var genero = req.body.genero;
    var sinopse = req.body.sinopse;

    animeModel.cadastrar_anime(foto, nome, autor, genero, sinopse);
}

function todos_animes(req, res) {
    animeModel.todos_animes().then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!");
        }
    }).catch(
        function (erro) {
            console.log(erro);
            console.log("Houve um erro ao realizar a consulta! Erro: ", erro.sqlMessage);
            res.status(500).json(erro.sqlMessage);
        }
    );
}

module.exports = {
    cadastrar_anime,
    todos_animes
}