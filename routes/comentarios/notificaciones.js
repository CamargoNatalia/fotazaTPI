const express = require('express');
const router = express.Router();
const notificacionesControllers = require('../../controllers/comentarios/notificacionesControllers');
const { requireAuth } = require('../../middleware/auth');

router.get('/comentarios', requireAuth, notificacionesControllers.comentariosRecibidos);

router.get('/valoraciones', requireAuth, notificacionesControllers.valoracionesRecibidas);

router.get('/notificaciones', requireAuth, notificacionesControllers.verNotificaciones);

module.exports = router;
