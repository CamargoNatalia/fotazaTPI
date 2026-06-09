const express = require('express');
const router = express.Router();

const denunciasComentariosControllers = require('../../controllers/comentarios/denunciasComentariosControllers');
const { requireAuth } = require('../../middleware/auth');


router.post('/:comentarioId', requireAuth, denunciasComentariosControllers.guardar);

// Ver denuncias de comentarios recibidas
router.get('/', requireAuth, denunciasComentariosControllers.listar);

module.exports = router;