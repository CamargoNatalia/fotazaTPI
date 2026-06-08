const express = require('express');
const router = express.Router();

const likeControllers = require('../controllers/controllers/likeControllers');

router.post('/:publicacionId', likeControllers.toggleLike);

module.exports = router;