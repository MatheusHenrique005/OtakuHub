var postModel = require("../models/postModel");

function publicar(req, res) {
    var titulo = req.body.tituloServer;
    var conteudo = req.body.conteudoServer;
    var imagem = req.body.imagemServer;
    var idUsuario = req.body.idUsuarioServer;

    postModel.publicar(idUsuario, titulo, conteudo, imagem)
}


module.exports = {
    publicar
}