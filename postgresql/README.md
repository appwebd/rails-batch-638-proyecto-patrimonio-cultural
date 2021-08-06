# Base de datos

La aplicación emplea como base de datos física Postgresql. El modelo de datos de la aplicación está
mostrado en la siguiente figura

[![Esta es una imagen de ejemplo](https://ejemplo.com/imagen.jpg)](https://ejemplo.com)

-------------------
TABLAS
```
calificacion	    Calificaciones de usuario de la plataforma a servicios ofrecidos en patrimonio Cultural
comuna	            Contiene las comunas de Chile
patrimonio	    Permite registrar patrimonio cultural de interés en la comuna
patrimonio_tipo	    Permite clasificar el tipo de Patrimonio cultural a mostrar en la plataforma
provincias	    Contiene las provincias de Chile
region	            Contiene las regiones de la división territorial de Chile
```

DICCIONARIO DE DATOS
```
Columna nombre	Tabla	Tipo de dato	Tamaño	Descripción
active	patrimonio_tipo	boolean		Permite saber si registro de tipo de patrimonio está activo
apellidos	users	char	60	Apellidos usuario de la plataforma
comuna_id	patrimonio	integer		Clave foranea identificador de comuna
datetime	users	datetime		Fecha hora
descripcion	calificacion	text		Descripción de calificación
descripcion	patrimonio	text		Descripción de patrimonio 
email	patrimonio	char	254	Correo electrónico de contacto
encrypted_password	users	varchar		Contraseña encriptada
fecha	calificacion	date		Fecha en la que se registra la calificación
geo_ref_latitud	patrimonio	decimal		geo referencia latitud
geo_ref_longitud	patrimonio	decimal		geo referencia longitud
id	users	integer		Clave primaria usuarios
id	calificacion	integer		Clave primaria calificación
id	patrimonio	integer		Clave primaria patrimonio
id	patrimonio_tipo	integer		Clave primaria tipo de patrimonio
id	comuna	integer		Clave primaria comuna
id	provincia	integer		Clave primaria provincia
id	region	integer		Clave primaria región
nombre	users	char	60	Nombre usuario 
nombre	patrimonio_tipo	char	60	Tipo de patrimonio, nombre identificador
nombre	comuna	char	60	Nombre de comuna
nombre	provincia	char	60	Nombre de provincia
nombre	region	char	60	Nombre de región
patrimonio_id	calificacion	integer		Clave foranea de patrimonio
patrimonio_tipo_id	patrimonio	integer		Clave foranea tipo de patrimonio
provincia_id	comuna	integer		Clave foranea provincia
ranking	calificacion	small integer		Ranking de calificación de 0 a 5 estrellas
region_id	provincia	integer		Clave foranea de región
region_ordinal	region	char	5	Región ordinal ejemplo I, II, III, IV ...
reset_password_token	users	varchar		Contraseña encriptada provisoria
telefono	patrimonio	char	15	Número de teléfono con el formato 56 9 9999 9999
tipo_usuario	users	small integer		Tipo de usuario Oferente / consumidor de recursos Patrimonio cultural
ubicacion	        patrimonio	char	200	Ubicación con el formato calle depto(/casa nro.
user_id	calificacion	integer		Clave foranea de usuario
user_id	patrimonio	integer		Clave foranea de usuario
```
