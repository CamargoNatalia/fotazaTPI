const express = require('express');
const router = express.Router();

const etiquetasController = require('../controllers/publicaciones/etiquetasControllers');
const { requireAuth } = require('../middleware/auth');

// lista etiquetas existentes
router.get('/', requireAuth, etiquetasController.listar);

module.exports = router;