const Publicacion = require('../../models/Publicacion');
const cloudinary = require('../../config/cloudinary'); 
const Archivo = require('../../models/Archivo');
const Like = require('../../models/Like');
const Comentario = require('../../models/Comentario');
const PublicacionEtiqueta = require('../../models/PublicacionEtiqueta');


async function modificarEstadoComentarios(req, res) {

  try {
    const publicacionId = req.params.id;
    const usuarioId = req.session.userId;

    //Busca publicacion
    const publicacion = await Publicacion.findByPk(publicacionId);

    if (!publicacion) {

      return res.status(404).send('Publicación no encontrada');
    }

    if (publicacion.usuarioId !== usuarioId) {

      return res.status(403).send('No tienes permiso para modificar esta publicación');
    }

    publicacion.comentarios_habilitados =
      !publicacion.comentarios_habilitados;
    await publicacion.save();
    res.redirect('/');

  } catch (error) {

    console.error('Error al modificar estado de comentarios:', error);

    res.status(500).send('Error interno del servidor');
  }
}

const eliminar = async (req, res) => {
  try {
    const publicacionId = req.params.id;
    const userId = req.session.userId;

    // Buscar la publicación
    const publicacion = await Publicacion.findByPk(publicacionId);

    if (!publicacion) {
      return res.status(404).send('Publicación no encontrada');
    }

    // Verificar que el usuario sea el dueño
    if (publicacion.usuarioId !== userId) {
      return res.status(403).send('No tenés permiso para eliminar esta publicación');
    }

    // Eliminar archivos asociados (opcional: también de Cloudinary)
    const archivos = await Archivo.findAll({
      where: { publicacionId }
    });

    // Opcional: Eliminar de Cloudinary
    for (const archivo of archivos) {
      // Extraer public_id de la URL de Cloudinary
      const urlParts = archivo.ruta.split('/');
      const filename = urlParts[urlParts.length - 1];
      const publicId = `fotaza/${filename.split('.')[0]}`;
      
      try {
        await cloudinary.uploader.destroy(publicId);
      } catch (cloudError) {
        console.error('Error al eliminar de Cloudinary:', cloudError);
      }
    }

    // Eliminar archivos de la base de datos
    await Archivo.destroy({
      where: { publicacionId }
    });

    // Eliminar likes asociados
    await Like.destroy({
      where: { publicacionId }
    });

    // Eliminar comentarios asociados
    await Comentario.destroy({
      where: { publicacionId }
    });

    // Eliminar etiquetas asociadas (la tabla intermedia)
    await PublicacionEtiqueta.destroy({
      where: { publicacionId }
    });

    // Finalmente, eliminar la publicación
    await publicacion.destroy();

    res.redirect('/');
  } catch (error) {
    console.error('Error al eliminar publicación:', error);
    res.status(500).send('Error al eliminar la publicación');
  }
};


module.exports = {
  modificarEstadoComentarios,
  eliminar
};