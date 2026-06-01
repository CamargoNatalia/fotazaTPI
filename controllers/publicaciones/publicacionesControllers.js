const Publicacion = require('../models/Publicacion');

async function modificarEstadoComentarios(req, res) {

  try {
    const publicacionId = req.params.id; //obtiene id

    const usuarioId = req.session.userId; //obtiene id de user logueado

    const publicacion = await Publicacion.findByPk(publicacionId);// busca publicacion por id

    if (!publicacion) {

      return res.status(404).send('Publicación no encontrada');
    } //valida si la publicacion existe

    if (publicacion.usuarioId !== usuarioId) {

      return res.status(403).send('No tienes permiso para modificar esta publicación');
    } //valida si el usuario es el dueño de la publicacion

    //cambia el estado de los comentarios
    publicacion.comentarios_habilitados =
      !publicacion.comentarios_habilitados;

    await publicacion.save();
    
    res.redirect('/');

  } catch (error) {

    console.error('Error al modificar estado de comentarios:', error);

    res.status(500).send('Error interno del servidor');
  }
}

module.exports = {
  modificarEstadoComentarios
};