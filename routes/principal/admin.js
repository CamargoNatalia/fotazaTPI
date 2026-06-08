const express = require('express');
const administradorControllers = require('../../controllers/usuarios/administradorControllers');
const { requireAuth, requireAdmin } = require('../../middleware/auth');

const router = express.Router();

// solo admin tiene acceso 
router.use(requireAdmin);

router.get('/', administradorControllers.listar);
router.post('/:id/hacer-admin', administradorControllers.hacerAdmin);
router.post('/:id/quitar-admin', administradorControllers.quitarAdmin);

module.exports = router;