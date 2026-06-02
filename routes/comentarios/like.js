const express = require('express');
const router = express.Router();

const likeController = require('../controllers/controllers/likeControllers');

router.post('/:publicacionId', likeController.toggleLike);

module.exports = router;