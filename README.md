## DOCKER-DJANGO
### Plantilla para crear un proyecto base de Django utilizando Docker

### Basado en python3 y debian 9

## Instala los siguientes paquetes:
* Entornos virtuales (Virtualenvswrapper)
* PIP
* Preparado para Pillow y Mysql

### Por defecto crea un usuario llamado 'django' en cuyo home debe crearse el proyecto

### Para construir la imagen se debe utiliazar:
``docker build -t docker-django .``

### Para lanzar un contenedor puede ejecutar:
``docker run -P -i -t docker-django /bin/bash``

### Movido a github
