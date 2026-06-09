const express = require('express');
const router = express.Router();

const comentarioControllers = require('../../controllers/comentarios/comentariosControllers');
const { requireAuth } = require('../../middleware/auth');

router.post('/:publicacionId', requireAuth, comentarioControllers.crear);

module.exports = router;