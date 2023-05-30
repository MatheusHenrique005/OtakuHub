var express = require("express");
var router = express.Router();

var postController = require("../controllers/postController");

router.post("/publicar", function (req, res) {
    postController.publicar(req, res);
})

router.get("/listar_publicacoes", function(req, res) {
    postController.listar_publicacoes(req, res);
})

router.get("/listar_publicacoes_usuario/:idUsuario", function(req, res) {
    postController.listar_publicacoes_usuario(req, res);
})

module.exports = router;