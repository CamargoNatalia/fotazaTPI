const express = require('express');
const router = express.Router();
const subirControllers = require('../../controllers/publicaciones/subirControllers');
const upload = require('../../middleware/uploads');

function validarSesion(req, res, next) {
  if (!req.session.userId) {
    return res.status(401).render('subir', {
      title: 'Subir publicación',
      error: 'Debes iniciar sesión para subir una publicación'
    });
  }

  next();
}


router.get('/', subirControllers.formulario);

// Guardar publicación
router.post('/', validarSesion, upload.array('imagenes'), subirControllers.guardar);

module.exports = router;