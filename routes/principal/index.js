const express = require('express');
const router = express.Router();

const { authenticateUser, logout } = require('../middleware/auth');
const indexController = require('../../controllers/usuarios/indexControllers');
const notificacionesController =require('../../controllers/notificaciones/notificacionesControllers');



router.get('/', indexControllers.inicio);

// Login
router.get('/login', (req, res) => {
  console.log('Entró a GET /login');

  if (req.session.userId) {
    return res.redirect('/');
  }

  res.render('login');
});

router.post('/login', authenticateUser, (req, res) => {
  res.redirect('/');
});

router.get('/notificaciones',notificacionesControllers.nuevosSeguidores);

router.get('/logout', logout);

module.exports = router;