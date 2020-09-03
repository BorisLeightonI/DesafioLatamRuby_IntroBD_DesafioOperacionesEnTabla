-- PARTE 1
-- 1. Crear Base de datos posts 
CREATE DATABASE post;
-- 2. Crear tabla post, con los atributos id, nombre de usuario, fecha de creación, contenido y descripción (1 punto)

CREATE TABLE post(
    id SERIAL PRIMARY KEY, 
    nombre_usuario VARCHAR(50), 
    fecha_creación TIMESTAMP, 
    contenido VARCHAR(100),
    descripcion VARCHAR(200)
);
-- 3. Insertar 3 post, 2 para el usuario "Pamela" y uno para "Carlos" 
INSERT INTO post(
nombre_usuario, 
fecha_creación, 
contenido, 
descripcion
) VALUES 
('Pamela', '2020-09-02 13:31:00', 'Contenido Post1 de pamela','Primer post de pamela'), 
('Pamela', '2020-09-02 13:32:00', 'Contenido Post2 de pamela','Segundo post de pamela'),
('Carlos', '2020-09-02 13:33:00', 'Contenido Post1 de Carlos','Primer post de Carlos');

-- 4. Modificar la tabla post, agregando la columna título 
ALTER TABLE post ADD COLUMN titulo;

--5. Agregar título a las publicaciones ya ingresadas 

UPDATE TABLE post SET titulo='Post Pamela' WHERE id=1;
UPDATE TABLE post SET titulo='Post Pamela' WHERE id=2;
UPDATE TABLE post SET titulo='Post Carlos' WHERE id=3;

--6. Insertar 2 post para el usuario "Pedro" 
INSERT INTO post(
nombre_usuario, 
fecha_creación, 
contenido, 
descripcion,
titulo
) VALUES
('Pedro','2020-09-02 13:41:00','Contenido del post de Pedro','Primer post de Pedro','post de pedro'),
('Pedro','2020-09-02 13:42:00','Contenido del post de Pedro','segundo post de Pedro','post de pedro');

--7. Eliminar el post de Carlos 

DELETE FROM post WHERE id=3;

--8. Ingresar un nuevo post para el usuario "Carlos" 

INSERT INTO post(
nombre_usuario, 
fecha_creación, 
contenido, 
descripcion,
titulo
) VALUES ('Carlos','2020-09-02 13:45:00','Nuevo Post de carlos','Otro Post de carlos','post de carlos' );
-- FIN PARTE 1

--PARTE 2
--9. Crear una nueva tabla, llamada comentarios, con los atributos id, fecha y hora de creación, contenido, que se relacione con la tabla posts.
CREATE TABLE comentarios(
id PRIMARY KEY,
fecha TIMESTAMP,
contenido VARCHAR(200)
CONSTRAINT fk_post FOREIGN KEY id REFERENCES post(id) ON DELETE CASCADE
);
--10. Crear 2 comentarios para el post de "Pamela" y 4 para "Carlos" 
INSERT INTO comentarios(id,fecha,contenido) VALUES
(1, '2020-09-02 13:57:00','Descripcion1 del comentario1 de pamela'),
(1, '2020-09-02 13:58:00','Descripcion2 del comentario1 de pamela'),
(5, '2020-09-02 13:59:00','Descripcion1 del comentario de Carlos'),
(5, '2020-09-02 14:00:00','Descripcion2 del comentario de Carlos'),
(5, '2020-09-02 14:00:00','Descripcion3 del comentario de Carlos'),
(5, '2020-09-02 14:00:00','Descripcion4 del comentario de Carlos');

--11. Crear un nuevo post para "Margarita"

INSERT INTO post(
nombre_usuario, 
fecha_creación, 
contenido, 
descripcion,
titulo
) VALUES 
('Margarita','2020-09-02 14:12:00','Primer Post de Margarita','Descripcion del post de margarita', 'Post de Margarita');

INSERT INTO comentarios(id,fecha,contenido) VALUES 
(7,'2020-09-02 14:16', 'Comentario al post de Margarita');

--12. Ingresar 5 comentarios para el post de Margarita. 
INSERT INTO comentarios(id,fecha,contenido) VALUES
(7, '2020-09-02 14:17:00','Comentario1 del post de Margarita'),
(7, '2020-09-02 14:18:00','Comentario2 del post de Margarita'),
(7, '2020-09-02 14:19:00','Comentario3 del post de Margarita'),
(7, '2020-09-02 14:20:00','Comentario4 del post de Margarita'),
