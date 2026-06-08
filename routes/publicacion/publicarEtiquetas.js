const express = require('express');
const router = express.Router();

const publicacionEtiquetaControllers = require('../../controllers/publicaciones/publicacionEtiquetaControllers');
const { requireAuth } = require('../../middleware/auth');

// Asocio etiquetas a una publicación
router.post('/:publicacionId', requireAuth, publicacionEtiquetaControllers.guardar);

module.exports = router;