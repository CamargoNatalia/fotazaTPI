const express = require('express');
const router = express.Router();

const etiquetasControllers = require('../../controllers/publicaciones/etiquetasControllers');
const { requireAuth } = require('../../middleware/auth');

// lista etiquetas existentes
router.get('/', requireAuth, etiquetasControllers.listar);

module.exports = router;