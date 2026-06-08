const express = require('express');
const usuariosControllers = require('../../controllers/usuarios/usuariosControllers');
const { requireAuth, requireAdmin } = require('../../middleware/auth'); 
const router = express.Router();

router.use(requireAuth);

router.get('/', usuariosControllers.listar);
router.get('/nuevo', requireAdmin, usuariosControllers.formulario);
router.post('/nuevo', requireAdmin, usuariosControllers.crear);

module.exports = router;