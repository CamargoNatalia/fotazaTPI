require('dotenv').config();
const express = require('express');
const path = require('path');
const session = require('express-session');
const sequelize = require('./models/db');

const app = express();

const PORT = process.env.PORT || 3000;

// CONFIGURACIÓN PUG

app.set('view engine', 'pug');
app.set('views', path.join(__dirname, 'views'));

// MIDDLEWARES

app.use(express.json());

app.use(express.urlencoded({
  extended: true
}));

app.use(express.static(path.join(__dirname, 'public')));

app.use(session({
  secret: process.env.SESSION_SECRET || 'fotaza-secret-key',
  resave: false,
  saveUninitialized: false,
  cookie: {
    secure: false,
    maxAge: 24 * 60 * 60 * 1000
  }
}));

app.get('/', (req, res) => {
  res.send('funcionando correctamente');
});
//SERVIDOR

sequelize.authenticate()
  .then(() => {
    console.log('Conexión a MySQL OK');
    app.listen(PORT, () => {
        console.log(`Servidor escuchando en http://localhost:${PORT}`);
    });
  })
  .catch(err => {
    console.error('Error al conectar a MySQL:', err);
  });

   
//Dependencias
// npm install express sequelize mysql2 multer express-session pug bcrypt dotenv sharp