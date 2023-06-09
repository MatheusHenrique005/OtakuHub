var postModel = require("../models/postModel");

function publicar(req, res) {

    const foto = req.file.filename;
    var titulo = req.body.titulo;
    var conteudo = req.body.conteudo;
    var idUsuario = req.body.idUsuario;

    postModel.publicar(idUsuario, titulo, conteudo, foto)
}

function listar_publicacoes(req, res){
    postModel.listar_publicacoes().then(function (resultado) {
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

function listar_publicacoes_usuario(req, res){

    var idUsuario = req.params.idUsuario;

    postModel.listar_publicacoes_usuario(idUsuario).then(function (resultado) {
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
    publicar,
    listar_publicacoes,
    listar_publicacoes_usuario
}