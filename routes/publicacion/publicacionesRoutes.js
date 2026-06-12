const express = require('express');
const router = express.Router();

const publicacionesControllers = require('../../controllers/publicaciones/publicacionesControllers');
const { requireAuth } = require('../../middleware/auth');

function validarSesion(req, res, next) {
  if (!req.session.userId) {
    return res.redirect('/login');
  }

  next();
}

router.post('/:id/modificar-estado-comentarios',validarSesion,publicacionesControllers.modificarEstadoComentarios);

router.post('/:id/eliminar', requireAuth, publicacionesControllers.eliminar);

module.exports = router;