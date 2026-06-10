const sequelize = require('./models/db');

sequelize.authenticate()
    .then(() => {
        console.log('✅ Conectado a PostgreSQL');
    })
    .catch(error => {
        console.error('❌ Error de conexión');
        console.error(error);
    });