const express = require('express');
const router = express.Router();

const interesadosControllers = require('../../controllers/intereses/interesadosControllers');
const { authenticateUser, requireAuth } = require('../../middleware/auth');


// Ver usuarios interesados en mis publicaciones
router.get('/', requireAuth, interesadosControllers.listar);

module.exports = router;