const express = require('express');
const usuariosControllers = require('../../controllers/usuarios/usuariosControllers');
const { requireAuth, requireAdmin } = require('../../middleware/auth'); 
const router = express.Router();

router.use(requireAuth);

router.get('/', requireAuth, usuariosControllers.listar);
router.get('/nuevo',  usuariosControllers.formulario);
router.post('/nuevo',  usuariosControllers.crear);

module.exports = router;
