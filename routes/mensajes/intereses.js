const express = require('express');
const router = express.Router();

const interesesControllers = require('../../controllers/intereses/interesesControllers');
const { requireAuth } = require('../../middleware/auth');


router.post('/:publicacionId', requireAuth, interesesControllers.guardar);
router.get('/mis-intereses', requireAuth, interesesControllers.listar);

module.exports = router;