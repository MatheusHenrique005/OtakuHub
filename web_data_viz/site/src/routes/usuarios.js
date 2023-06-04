var express = require("express");
var router = express.Router();
const upload = require('../config/configUpload');

var usuarioController = require("../controllers/usuarioController");

router.get("/", function (req, res) {
    usuarioController.testar(req, res);
});

router.get("/listar", function (req, res) {
    usuarioController.listar(req, res);
});

router.post("/votar", function (req, res){
    usuarioController.votar(req, res)
});

//Recebendo os dados do html e direcionando para a função cadastrar de usuarioController.js
router.post("/cadastrar", function (req, res) {
    usuarioController.cadastrar(req, res);
})

router.post("/autenticar", function (req, res) {
    usuarioController.entrar(req, res);
});

router.post("/atualizar_perfil", upload.single('foto'), function (req, res){
    usuarioController.atualizar_perfil(req, res);
});

module.exports = router;