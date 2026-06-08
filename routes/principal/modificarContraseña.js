const express = require('express');
const modiControllers = require('../../controllers/usuarios/modificarControllers');
const router = express.Router();

router.get('/', modiControllers.formulario);
router.post('/', modiControllers.modificar);

module.exports = router;