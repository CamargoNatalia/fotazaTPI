const express = require('express');
const router = express.Router();

const valoracionControllers = require('../controllers/comentarios/valoracionControllers');
const { requireAuth } = require('../../middleware/auth');


router.post('/:archivoId', requireAuth, valoracionControllers.guardar);

module.exports = router;