# Instalacion de Maven

## 1. Intalacion en Ubuntu
* Actualizamos la base de datos del gestor de paquetes:
```
$ sudo apt-get update
```
* Instalamos maven:
```
$ sudo apt-get install -y maven
```
### 1.2
* Verificamos que la instalacion haya sido exitosa:
```
$ mvn -v
Apache Maven 3.3.9
Maven home: /usr/share/maven
Java version: 1.8.0_101, vendor: Oracle Corporation
Java home: /usr/lib/jvm/java-8-oracle/jre
Default locale: en_US, platform encoding: UTF-8
OS name: "linux", version: "4.4.0-36-generic", arch: "amd64", family: "unix"
```

## 2. Instalacion en centOS7
* Agregamos maven a las librerias yum
```
$ sudo wget http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo
```
* Instalamos maven
```
$ sudo yum install -y apache-maven
```
### 2.1
* Verificamos que  la instalacion haya sido exitosa:

```
$ mvn -v
Apache Maven 3.3.9 (bb52d8502b132ec0a5a3f4c09453c07478323dc5; 2015-11-10T10:41:47-06:00)
Maven home: /usr/local/apache-maven-3.3.9
Java version: 1.8.0_131, vendor: Oracle Corporation
Java home: /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.131-2.b11.el7_3.x86_64/jre
Default locale: es_MX, platform encoding: UTF-8
OS name: "linux", version: "3.10.0-327.el7.x86_64", arch: "amd64", family: "unix"

```


# Configuracion de un proyecto en maven
## 1. Generamos el proyecto:
* Para crear el proyecto de maven nos basamos en arquetipos, que seria como nuestra plantilla.
```
$ mvn -B archetype:generate \
  -DarchetypeGroupId=org.apache.maven.archetypes \
  -DgroupId=com.mycompany.app \
  -DartifactId=my-app
```
Una vez que hemos ejecutado el comando veremos que se a creado una carpeta my-app y continene un archivo pom.xml, que es nuestro [POM](https://drive.google.com/open?id=0B_baVQR7xUEWekVRNjUwd181N00).

## 2. Compilamos y empaquetamos el proyecto
* Veremos que se genero una carpeta my-app/, entramos en ella y ejecutamos el siguiente comando para comilar los recursos de la aplicacion.
```
$ mvn compile
```
* Despues de haber compilado exitosamente compilaremos y ejecutaremos los unit test.
```
$ mvn test
```
* Lo ultimo que haremos sera empaquetar, lo cual nos generara un jar.
```
$ mvn install
```
## 3. Probar el jar recien generado
* Por ultimo veremos que todo haya salido bien, ejecutando el jar.
```
$ java -cp target/my-app-1.0-SNAPSHOT.jar com.mycompany.app.App
```
Esto debe dar como resultado la siguiente salida:
```
Hello World!
```
