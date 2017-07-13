# Configuración para enviar archivos desde una VM a contenedor HDFS

Se utilizó una imagen del docker registry del equipo QA de datio:
Logearse en el docker registry, para ello pedir permiso al equipo de QA cómo hacerlo.


Se edita el archivo `/etc/docker/daemon.json ` con la línea:
`{ "insecure-registries":["qa.datio.mx:5000"] }`  

Reiniciar el demonio de docker:

`sudo service docker restart`


Una vez que se han dado los permisos para acceder al registry, escribir desde terminal:

`sudo docker login qa.datio.mx:5000`


### Pull a la imagen y un run:

`sudo docker pull qa.datio.mx:5000/datiomx/hdfs:0.0.1`

`sudo docker run -dit --name hdfs -p 9000:9000 -p 50010:50010 -v /tmp/hdfs/:/home/root/data/hdfs --hostname hdfs.dev.datio.com qa.datio.mx:5000/datiomx/hdfs:0.0.1`

### Configuración: 

Agregar la siguiente línea al archivo /etc/hosts del host local:

`127.0.0.1 hdfs.dev.datio.com`

Configurar el  etc/hadoop/core-site.xml:

```xml 
<configuration>
<property>
<name>fs.defaultFS</name>
<value>hdfs://hdfs.dev.datio.com:9000</value>
</property>
</configuration>

```

### En la máquina virtual configurar los archivos:
1. En el etc/hadoop/core-site.xml:
```xml
<configuration>
<property>
<name>fs.defaultFS</name>
<value>hdfs://hdfs.dev.datio.com:9000</value>
</property>
</configuration>

```

2. En etc/hadoop/hdfs-site.xml:

```xml
<property>
     <name>dfs.datanode.use.datanode.hostname</name>
    <value>true</value>
  </property>
  <property>
    <name>dfs.client.use.datanode.hostname</name>
    <value>true</value>`
  </property>
  ```

3. En el /etc/hosts de la maquima virtual agregar:

`ip_maquina_local  hdfs.dev.datio.com` --> ojo es la ip del host local, no de la maquina virtual.


Desde el home de hadoop en la maquina virtual se crea un directorio en el HDFS del contenedor donde se guardará el archivo:

`bin/hdfs dfs -mkdir /user`

Se envía el archivo con un put:

`bin/hdfs dfs -put  /root/hadoop-2.8.0/README.txt /user`

 Se comprueba  su contenido con un cat:
 
`bin/hdfs dfs -cat  /root/hadoop-2.8.0/README.txt /user/README.tx`




 

