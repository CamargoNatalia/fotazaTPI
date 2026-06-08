const express = require('express');
const router = express.Router();
const coleccionesControllers = require('../../controllers/colecciones/coleccionesControllers');
const { requireAuth } = require('../../middleware/auth');

router.get('/', requireAuth, coleccionesControllers.listar);
router.get('/nueva', requireAuth, coleccionesControllers.formulario);
router.post('/nueva', requireAuth, coleccionesControllers.guardar);
router.post('/:id/eliminar', requireAuth, coleccionesControllers.eliminar);
router.get('/:id', requireAuth, coleccionesControllers.verColeccion);


router.post('/:id/agregar/:publicacionId', requireAuth, coleccionesControllers.agregarPublicacion);

module.exports = router;