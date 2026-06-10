const express = require('express');
const recuperarControllers = require('../../controllers/usuarios/recuperarControllers');

const router = express.Router();

router.get('/', recuperarControllers.formulario);
router.post('/', recuperarControllers.recuperar);
module.exports = router;