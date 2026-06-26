Este programa se realizó para demostrar el manejo de las acciones de trabajadores de una empresa y mas que nada la creación de un procedimiento y trigger.

Al entrar al programa este tiene una venta la cual pide ingresar con un usuario, para este programa se creó la usuario "Susa" con la contraseña "Susa", esta usuario solo puede ver una 
tabla llamada "Productos", en la cual solo puede ver los datos de esta, y en caso de que se actualice la información de estatiene un botón para actualizar la tabla, asi como un botón
de cerrar sesión. En la base de datos se deseaba poder hacer una carga de datos desde Excel, por que se hizo un procedimiento el cual verificaba si los valores del Excel correspondian con 
una tabla "bruta" de productos (tabla igual a la de productos solo que esta está hecha para no afectar a la principal), si ciertos productos estaban mal, no se cargaban en la tabla, pero los
que si, se usaba un trigger con el cual se cargaban los datos de la tabla productos bruta  a la tabla principal.

Todo este programa fue hecho en Java, con NetBeans y todo el manejo de las bases fue con MySQl, en el Maneajador Workbench
