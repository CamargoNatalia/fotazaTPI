const express = require('express');
const router = express.Router();

const publicacionesControllers = require('../../controllers/publicaciones/publicacionesControllers');

function validarSesion(req, res, next) {
  if (!req.session.userId) {
    return res.redirect('/login');
  }

  next();
}

router.post(
  '/:id/modificar-estado-comentarios',
  validarSesion,
  publicacionesControllers.modificarEstadoComentarios
);

module.exports = router;