var express = require("express");
var router = express.Router();
const upload = require('../config/configUpload');

var animeController = require("../controllers/animeController");

router.post("/cadastrar_anime", upload.single('foto'), function (req, res) {
    animeController.cadastrar_anime(req, res);
})

router.post("/enviar_votos", function (req, res) {
    animeController.enviar_votos(req, res);
})

router.get("/todos_animes", function (req, res) {
    animeController.todos_animes(req, res);
})

router.get("/trazer_info/:id_anime", function (req, res) {
    animeController.trazer_info(req, res);
})

router.get("/trazer_votos", function (req, res){
    animeController.trazer_votos(req, res);
})

module.exports = router;