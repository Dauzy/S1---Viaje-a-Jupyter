# Ansible, creación de Playbook para la automatización de ordenes de Docker


 Para este ejemplo estamos ocupando *CentOS 7*

## 1.- Instalar Ansible
```
$ sudo yum  install ansible
```
## 2.- Intercambiar llaves ssh con los demás usuarios
```
$ ssh-keygen -t rsa
$ ssh-copy-id usuario@[host o ip]
```
## 3.- Editar el inventory o archivo de configuración de los hosts de Ansible
* El archivo está en la siguiente ruta  /etc/ansible
* Una vez que ya estamos en el archivo hosts tenemos que agregar las siguientes lineas:
```
[tests]
martha host1=192.168.1.67
daniel host2=192.168.1.77
```
* Así como lo muestra la siguente imagen(Las líneas que no están comentadas)
![alt text](https://github.com/Dauzy/S1---Viaje-a-Jupyter/blob/martha_cr/imagen1.png)

## 4.- Ahora empecemos  hacer uso de comandos básicos de Ansible
```
$ ansible -m ping all
```
* La salida debería ser la  siguiente, así como lo muestra la imagen
![alt text](https://github.com/Dauzy/S1---Viaje-a-Jupyter/blob/martha_cr/imagen2.png)
## 5.- Ahora haremos un ejemplo de un Playbook (El archivo que generemos debe ir con la extención .yml)
```YAML
---
- hosts: martha # AQUÍ ESPECIFICAMOS AL HOST O GRUPO DE HOST 
  remote_user: root # USUARIO QUE OCUPAMOS PARA EJECUTAR LAS TAREA
  tasks:
   - name: Levantar el servicio de Docker 
     service: name=docker state=started # LEVANTAMOS EL DEMONIO DEDOCKER
   - name: Crear un contenedor de apache 
     docker_container: #CREAMOS  UN CONTENEDOR
        name: Apache #NOMBRE DEL CONTENEDOR
        image: httpd #IMAGEN DE LA CUAL APARTIR VAMOS A CREAR EL CONTENEDOR
        volumes: /opt/apache:/var/www/html # VOLUMEN  QUE ESTAMOS MONTANDO DEL HOST AL CONTENEDOR
        ports: 8080:80 # PUERTO DONDE ESTAMOS PUBLICANDO EL SERVICIO
   - name: Mostrar todos los contenedores que se están ejecutándose
     command: docker ps 
     register: docker
   - debug: var=docker.stdout
```
## 6.- Ahora ejecutamos nuestro Playbook
```
ansible-playbook nombre_playbook.yml
```
 * Al ejecutar  nuesro Playbook la salida debería ser la siguiente.
![alt text](https://github.com/Dauzy/S1---Viaje-a-Jupyter/blob/martha_cr/imagen3.png)



