const { Model, DataTypes } = require('sequelize');
const sequelize = require('./db');
const Usuario = require('./Usuario');

class Mensaje extends Model {}

Mensaje.init(
  {
    contenido: {
      type: DataTypes.TEXT,
      allowNull: false
    }
  },
  {
    sequelize,
    modelName: 'Mensaje',
    tableName: 'mensajes'
  }
);

Mensaje.belongsTo(Usuario, {
  foreignKey: 'emisorId',
  as: 'emisor'
});

Mensaje.belongsTo(Usuario, {
  foreignKey: 'receptorId',
  as: 'receptor'
});

module.exports = Mensaje;