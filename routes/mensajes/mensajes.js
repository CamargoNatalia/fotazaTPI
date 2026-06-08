const express = require('express');
const router = express.Router();

const mensajesControllers = require('../controllers/mensajes/mensajesControllers');
const { requireAuth } = require('../../middleware/auth');

router.get('/', requireAuth, mensajesControllers.recibidos);

router.get('/:usuarioId', requireAuth, mensajesControllers.conversacion);

router.post('/:usuarioId', requireAuth, mensajesControllers.enviar);

module.exports = router;