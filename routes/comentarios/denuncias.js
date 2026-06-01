const express = require('express');
const router = express.Router();

const denunciasControllers = require('../controllers/comentarios/denunciasControllers');
const { requireAuth } = require('../middleware/auth');


router.get('/:publicacionId', requireAuth, denunciasControllers.formulario);

router.post('/:publicacionId', requireAuth, denunciasControllers.guardar);

module.exports = router;