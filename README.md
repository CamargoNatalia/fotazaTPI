Fotaza es una aplicación web para compartir fotos y videos, donde los usuarios pueden publicar contenido, interactuar mediante comentarios y valoraciones, si lo desean y estan interesdos en la compra de alguna imagen o video poder comunicarse atravez de una mensajeria para poder realizar la compra, tambien seguir a otros usuarios, y gestionar sus propias colecciones.

## Tecnologías utilizadas

- En el back con Node.js + Express.js
- Base de datos en PostgreSQL (Neon)
- ORM Sequelize
- Motor de plantillas(Pug)
- Autenticacion con Sesiones (express-session)
- Imagenes con Cloudinary
- Estilos con css

## Requisitos

- Node.js
- npm
- Cloudinary
- Base de datos PostgreSQL (Neon)

## Funcionalidades implementadas

Usuarios autenticados
Registro e inicio de sesión
Modificar contraseña
Recuperar contraseña

Publicaciones
Subir imágenes y videos (múltiples archivos)
Agregar descripción y etiquetas
Protección con marca de agua (copyright)
Eliminar publicaciones propias

Interacciones
Comentarios (habilitar/deshabilitar por el autor de la publicacion)
Valoración de imágenes (1 a 5 estrellas)
Likes en publicaciones
Denuncias de publicaciones y comentarios

Seguimiento
Seguir/Dejar de seguir usuarios
Ver seguidores y seguidos

Notificaciones
Comentarios recibidos
Valoraciones recibidas
Nuevos seguidores
"Me interesa" en publicaciones

Mensajería
Mensajes privados entre usuarios
Conversaciones por publicación

Colecciones
Crear colecciones personalizadas
Guardar publicaciones en colecciones

Buscador
Búsqueda por texto
Filtro por tipo (imagen/video)
Ordenamiento (más recientes, mejor valoración, más likes)
Filtro por fechas
Filtro por likes mínimos

Moderación
Panel de moderación para administradores
Gestión de denuncias

## Instalación para el proyecto

repositorio:
git clone https://github.com/CamargoNatalia/fotazaTPI.git

## Dependencias:

npm install express sequelize pg pg-hstore multer express-session pug bcrypt dotenv sharp cloudinary multer-storage-cloudinary

## Variables de entorno:

.env.example
Variables utilizadas:
DB_NAME=
DB_USER=
DB_PASSWORD=
DB_HOST=
DB_PORT=
DATABASE_URL=
PORT=
SESSION_SECRET=
CLOUDINARY_CLOUD_NAME=
CLOUDINARY_API_KEY=
CLOUDINARY_API_SECRET=

Ejecutar la aplicación:
npm start
La aplicación corre en el puerto 3000:
http://localhost:3000

## Estructura del proyecto

fotaza-tpi
\*Config Configuraciones (Cloudinary)

\*Controladores:
-colecciones
-comentarios
-intereses
-mensajes
-publicaciones
-usuarios
-valoraciones

*middleware (auth, uploads)
*Models (Modelos de Sequelize)
*public (Archivos estáticos )
*routes (Rutas de la aplicación)
\*views (Plantillas Pug)

- .env.example (Ejemplo de variables de entorno)
  *app.js ( Archivo principal)
  *package.json
  \*README.md

Usuarios:
DNI 12345678 Contraseña test123(usuarioADMIN)
DNI 333 Contraseña 5678(usuarioComun)

URL de produccion:(Vercel)
https://fotaza-tpi.vercel.app/
