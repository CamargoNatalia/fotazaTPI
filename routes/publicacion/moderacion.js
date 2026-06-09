const express = require('express');
const router = express.Router();
const moderacionControllers = require('../../controllers/publicaciones/moderacionControllers');
const { requireAuth, requireAdmin} = require('../../middleware/auth');


router.get('/', requireAuth, requireAdmin, moderacionControllers.listar);
router.post('/:publicacionId', requireAuth, requireAdmin, moderacionControllers.veredicto);

module.exports = router;