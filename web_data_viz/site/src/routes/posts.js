var express = require("express");
var router = express.Router();

var postController = require("../controllers/postController");

router.post("/publicar", function (req, res) {
    postController.publicar(req, res);
})

module.exports = router;