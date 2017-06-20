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
