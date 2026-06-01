const express = require('express');
const router = express.Router();

const comentarioController = require('../controllers/comentarioController');
const { requireAuth } = require('../middleware/auth');

router.post('/:publicacionId', requireAuth, comentarioController.crear);

module.exports = router;