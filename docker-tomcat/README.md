# Crear un dockerfile de tomcat

Para la construccion y ejecucion de un ambiente tomcat son necesarios los siguientes pasos descritos:

## 1. Instalacion y configuracion de docker:
   * #### Instalacion en centos7:
* Actualizamos las base de datos del gestor de paquetes:
```
$ sudo yum check-update -y
```
* Instalamos desde el repositorio oficial de docker, este comando descargara la ultima version de docker y ejecutara el script de instalacion
```
$ curl -fsSL https://get.docker.com/ | sh
```
* Despues de haber instalado, iniciaremos y habilitaremos el servicio de docker
 ```
 $ sudo systemctl start docker
  $ sudo systemctl enable docker
 ```

## 2. Construir una imagen a partir de un dockerfile:
* Construimos la imagen de docker
```
$ sudo docker build -t my_tomcat .
```
* Corremos el contenedor y pasamos el puerto para tener acceso fuera del contenedor
```
$ sudo docker run --name tomcat-server -p 8080:8080 -d my_tomcat
```
* Iremos a la direccion ```localhost:8080``` y verificamos que el contenedor este arriba

# Explicacion Breve de un Dockerfile
Los contenedores en docker son creados a partir de una imagen la cual es construida a partir de un dockerfile.

Un dockerfile es un script que contiene una serie de instrucciones, las cuales se ejecutaran secuencialmente, y crear una nueva imagen automaticamente.

Nota: Al ejecutar comandos del gestor de paquetes (yum install o apt-get install) se crea una nueva capa.

Una dockerfile se empieza definiendo la imagen por la que partira para crear una nueva imagen que se utilizara para crear un nuevo contenedor.
