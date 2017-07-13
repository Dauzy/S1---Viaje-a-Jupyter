# Configuración de Edge Node en HDFS

Esta configuración se estableció  para poder enviar el archivo de la tabla creada en la máquina virtual de Teradata hacia hdfs  usando el comando `hdfs dfs -put` . 

** NOTA: se hizo en un hdfs local. **

Primero hay que descargar el paquete de hadoop desde:

http://www.apache.org/dyn/closer.cgi/hadoop/common/hadoop-2.8.0/hadoop-2.8.0-src.tar.gz
 
Descomprimirlo:
`tar xvzf file.tar.gz`


#### Configurar dentro de el directorio de hadoop-2.8.0/etc/hadoop/ los siguientes archivos:

core-site.xml
yarn-site.xml
mapred-site.xml
hadoop-env.sh
/etc/hosts
~/.bashrc

Editar en core-site.xml:

`<configuration>`
`<property>`
  `<name>fs.default.name</name>`
    `<value>hdfs://MASTERHADOOP:9000</value>`
`</property>`
`</configuration>`

Editar en yarn-site.xml:

`<property>`
  `<name>yarn.nodemanager.aux-services</name>`
    `<value>mapreduce_shuffle</value>`
`</property> `
`<property>`
 `<name>yarn.resourcemanager.address</name>`
  `<value>MASTERHADOOP:8032</value>`
`</property>`
`</configuration>`

Editar archivo mapred-site.xml:

`<configuration>`
`<property>`
  `<name>mapreduce.framework.name</name>`
   `<value>yarn</value>`
 `</property>`
`<property>`
 ` <name>mapreduce.jobtracker.address</name>`
  ` <value>MASTERHADOOP:9001</value>`
 `</property>`
`</configuration>`

Establecer  o cambiar la variable JAVA_HOME dentro de etc/hadoop/hadoop-env.sh:

En el caso de mi máquina, la ruta es: 

`# The java implementation to use.`

`export JAVA_HOME='/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.131-3.b12.el7_3.x86_64/jre/'`

Configurar las variables de entorno de los siguientes archivos del  host:

En el ~/.bashrc:

`export JAVA_HOME=/location/to/your/path7/jdk8/`
`export HADOOP_HOME=home/path/to/hadoop`
`export HADOOP_INSTALL=$HADOOP_HOME`
`export HADOOP_MAPRED_HOME=$HADOOP_HOME`
`export HADOOP_COMMON_HOME=$HADOOP_HOME`
`export HADOOP_HDFS_HOME=$HADOOP_HOME`
`export YARN_HOME=$HADOOP_HOME`
`export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_HOME/lib/native`
`export PATH=$PATH:$HADOOP_HOME/sbin:$HADOOP_HOME/bin:$JAVA_HOME/bin`
`export HADOOP_CONF_DIR="${HADOOP_HOME}/etc/hadoop/"`
`export HADOOP_LIBEXEC_DIR="${HADOOP_HOME}/libexec"`

En /etc/hosts: 

`my_ip   MASTERHADOOP  #--> hostaname de la ip`

Para cargar los cambios:
`source  ~/.bashrc `

#### Generar las llaves ssh para logearse de forma segura en hadoop-hdfs:
Crear las llaves:
`ssh-keygen -t rsa`

En el prompt `“Enter file in which to save the key (/home/demo/.ssh/id_rsa):”`
presionar enter

En el prompt `“Enter passphrase (empty for no passphrase):”`
presionar enter

Aparecerá una leyenda de que las llaves fueron generadas.
Colocar la llave pública en el servidor hadoop:
`ssh-copy-id user_hadoop@MASTERHADOOP` --> se recomienda tener un usuario específico para hadoop.
En el promt que aparecerá escribir “yes” y después pedirá escribir la contraseña del usuario user_hadoop o con el que se crearon las llaves.

####  Inicializar los servicios de hadoop-hdfs:
Ubicarse en el directorio de hadoop y ejecutar:

	`sbin/start-all.sh`

Crear un directorio donde se va guardar el archivo de la base de datos:
 `hdfs dfs -mkdir /path_to_directory`

Establecer permisos a ese directorio para que se pueda guardar el archivo, la siguiente opción no debe establecerse en ambientes de producción porque cualquiera podría leer, escribir y ejecutar:

`hdfs dfs -chmod 777 /path_to_directory`

Para poder hacer el `-put` hacia el hdfs local hay que descargar el paquete .tar de hadoop en la maquina virtual  sin necesidad de ejecutarlo, tan solo se necesita configurar las variables de entorno de hadoop y java de la máquina virtual para que se reconozca el comando `hdfs dfs -put` .

#### Descargar el paquete hadoop-2.8.0-src.tar.gz en la máquina virtual o copiar si ya se tiene uno desde la terminal del host local a la maquina virtual:

`scp path_to_tar_file root@ip_maquina_virtual:/path_to_save_tar_file`

Descomprimir el archivo tar y ubicarse dentro del directorio hadoop.
Configurar las variables de entorno de hadoop y java en .bashrc:

Para saber la ruta  del jdk de java:
`readlink -f $(which java)`

Después editar el archivo ~/.bashrc:

`export JAVA_HOME=path_jdk_java`
`export HADOOP_HOME=/path_to_hadoop_home`
`export HADOOP_INSTALL=$HADOOP_HOME`
`export HADOOP_MAPRED_HOME=$HADOOP_HOME`
`export HADOOP_COMMON_HOME=$HADOOP_HOME`
`export HADOOP_HDFS_HOME=$HADOOP_HOME`
`export YARN_HOME=$HADOOP_HOME`
`export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_HOME/lib/native`
`export PATH=$PATH:$HADOOP_HOME/sbin:$HADOOP_HOME/bin:$JAVA_HOME/bin`
`export HADOOP_CONF_DIR="${HADOOP_HOME}/etc/hadoop/"`
`export HADOOP_LIBEXEC_DIR="${HADOOP_HOME}/libexec"`

Dentro del archivo etc/hadoop/core-site.xml del hadoop local ubicar el value:

`<configuration>`
`<property>`
 ` <name>fs.default.name</name>`
  `  <value>hdfs://MASTERHADOOP:9000</value> --> copiar esta dirección`
`</property>`
`</configuration>`

Esa direccion se pondrá en el put. 

#### Desde el directorio de hadoop en la maquina virtual hacer el put del archivo hacia el HDFS:

`hdfs dfs -put /path_to_file.csv hdfs://MASTERHADOOP:9000/path_to directory`

Comprobar que se copió el archivo al HDFS:

`hdfs dfs -ls  hdfs://MASTERHADOOP:9000/path_to_file`
