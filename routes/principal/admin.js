const express = require('express');
const administradorController = require('../controllers/usuarios/administradorControllers');
const { requireAuth, requireAdmin } = require('../middleware/auth');

const router = express.Router();

// solo admin tiene acceso 
router.use(requireAdmin);

router.get('/', administradorController.listar);
router.post('/:id/hacer-admin', administradorController.hacerAdmin);
router.post('/:id/quitar-admin', administradorController.quitarAdmin);

module.exports = router;