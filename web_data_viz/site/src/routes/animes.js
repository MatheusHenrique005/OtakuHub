var express = require("express");
var router = express.Router();
const upload = require('../config/configUpload');

var animeController = require("../controllers/animeController");

router.post("/cadastrar_anime", upload.single('foto'), function (req, res) {
    animeController.cadastrar_anime(req, res);
})

router.get("/todos_animes", function (req, res){
    animeController.todos_animes(req, res);
})

module.exports = router;