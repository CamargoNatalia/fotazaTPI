const express = require('express');
const router = express.Router();
const likeControllers = require('../../controllers/comentarios/likeControllers');

router.post('/:publicacionId', likeControllers.toggleLike);

module.exports = router;