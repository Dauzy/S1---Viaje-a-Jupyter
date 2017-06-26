# Ansible, creación de Playbook para la automatización de ordenes de Docker

## Ay Dios no sé cómo se hace esto, pero vamo a darle!

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
```
* Así como lo muestra la siguente imagen(Las líneas que no están comentadas)
![alt text](https://github.com/Dauzy/S1---Viaje-a-Jupyter/blob/martha_cr/imagen1.png)

## 4. Ahora empecemos  hacer uso de comandos básicos de Ansible
```
ansible -m ping all
```
* La salida debería ser la  siguiente, así como lo muestra la imagen
![alt text](https://github.com/Dauzy/S1---Viaje-a-Jupyter/blob/martha_cr/imagen2.png)


