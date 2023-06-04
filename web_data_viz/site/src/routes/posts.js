var express = require("express");
var router = express.Router();
const upload = require('../config/configUpload');

var postController = require("../controllers/postController");

router.post("/publicar", upload.single('foto'), function (req, res) {
    postController.publicar(req, res);
})

router.post("/cadastrar_anime", function(req, res){
    postController.cadastrar_anime(req, res);
})

router.get("/listar_publicacoes", function(req, res) {
    postController.listar_publicacoes(req, res);
})

router.get("/listar_publicacoes_usuario/:idUsuario", function(req, res) {
    postController.listar_publicacoes_usuario(req, res);
})

module.exports = router;