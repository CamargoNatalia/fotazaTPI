const { Model, DataTypes } = require('sequelize');
const sequelize = require('./db');
const Usuario = require('./Usuario');

class Publicacion extends Model {}

Publicacion.init(
  {
    descripcion: {
      type: DataTypes.TEXT,
      allowNull: false
    },

    ubicacion: {
      type: DataTypes.STRING(255),
      allowNull: true,
      defaultValue: ''
    },

    fecha: {
      type: DataTypes.DATE,
      defaultValue: DataTypes.NOW
    },

    comentarios_habilitados: {
      type: DataTypes.BOOLEAN,
      allowNull: false,
      defaultValue: true
    },

    estadoPublicacion: {
      type: DataTypes.STRING,
      allowNull: false,
      defaultValue: 'activa'
    }
  },
  {
    sequelize,
    modelName: 'Publicacion',
    tableName: 'publicaciones'
  }
);

Usuario.hasMany(Publicacion, { foreignKey: 'usuarioId' });
Publicacion.belongsTo(Usuario, { foreignKey: 'usuarioId' });

module.exports = Publicacion;


/*datos para workbrench:

CREATE TABLE publicaciones (
    id INT AUTO_INCREMENT PRIMARY KEY,

    descripcion TEXT NOT NULL,
    fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
    comentarios_habilitados BOOLEAN NOT NULL DEFAULT TRUE,
    estadoPublicacion VARCHAR(50) NOT NULL DEFAULT 'activa',
    usuarioId INT NOT NULL,

    CONSTRAINT fk_publicacion_usuario
        FOREIGN KEY (usuarioId)
        REFERENCES usuarios(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
*/