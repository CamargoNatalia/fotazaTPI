const express = require('express');
const usuariosControllers = require('../../controllers/usuarios/usuariosControllers');
const { requireAuth, requireAdmin } = require('../../middleware/auth'); 
const router = express.Router();

console.log("🟢 Cargando rutas de usuarios");

// Rutas públicas
router.get('/nuevo', (req, res, next) => {
  console.log("🔵 GET /nuevo interceptado");
  next();
}, usuariosControllers.formulario);

router.post('/nuevo', usuariosControllers.crear);

// Rutas protegidas
router.use(requireAuth);

router.get('/', usuariosControllers.listar);

module.exports = router;