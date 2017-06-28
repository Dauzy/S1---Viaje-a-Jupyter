#Instalación de Teradata

###Instalación de máquina virtual:

Descargar el Workstation VMware Player desde http://my.vmware.com/web/vmware/downloads/index.html

Escoger la última version: 
VMware-Workstation-Full-12.5.6-5528349.x86_64.bundle

Descargar a un directorio y ejecutar: 
`sudo sh VMware WorkstationFull12.5.6-5528349.x86_64.bundle`

Una vez configurada, cerrar y desde terminal se ejecuta:
`vmplayer`

###Descargar Teradata:

Para descargar la versión 16.X de Teradata, registrarse en la página http://downloads.teradata.com/

En la sección Downloads, en la opción Teradata Express hacer click en VMware.

Descargar el paquete de la versión TDExpress16.00.04_Sles11_40GB.7z 

####Usando un extractor de archivos 7zip, extraer el paquete en el directorio donde se descargó VMware:

#####**Instalar el paquete  p7zip**
	Primero instalar el repositorio epel: 
	`sudo yum install epel-release`

	Instalación del paquete p7zip:
	`sudo yum install p7zip`
	
**Extraer el paquete de Teradata en el directorio definido con el comando:**
`7za x -o/directorio_destino TDExpress16.00.04_Sles11_40GB.7z`

Usar la opción -o  patra extraer el paquete en un directorio distinto al actual. 

###Instalación de Teradata en la máquina virtual: 

Abrir el VMware Player desde el directorio donde se descargó:

`vmplayer`

Click en open virtual machine.

Seleccionar el archivo .vmx dentro de la carpeta  donde el paquete TDExpress16.00.04_Sles11_40GB.7z fue extraído.

Click en play on para encender la base de datos.

Autenticarse:
` Login: root
Password: root`


Probar la instalación:

Confirmar que la base de datos está corriendo: 
Abrir GNOME terminal y escribir:
`pdestate -a`
Aparecerá la siguiente información:
`PDE state is RUN/STARTED.` 
`DBS state is 5: Logons are enabled - The system is quiescent`

Escribir el comando:

`/usr/bin/bteq`
En el login prompt escribir:
`.logon 127.0.0.1/dbc` 
En el prompt del password:
`dbc`

La sesión BTEQ reportará que te logeaste con éxito: 
Logon successfully completed.
` *** Teradata Database Release is 16.00.00.04                   
 *** Teradata Database Version is 16.00.00.04                     
 *** Transaction Semantics are BTET.
 *** Session Character Set Name is 'ASCII'. ` 
 
 ` *** Total elapsed time was 1 second. `

Ejecutar un script:
`select * from dbc.dbcinfo`

Aparecerá una tabla con información de la base de datos y la leyenda

`*** Query completed`

Para salir:
`quit`


###Para conectarse desdel el host a la VM:

Asegurarse que la opción bridge esté habilitada en VMsettings >Network adapter

Después conectarse como sudo porque la configuración inicial de la VM se estableció como root:

`sudo ssh virtualmachine-ip`

Escribir en el prompt del password:
`root`

Ejecutar la herramienta bteq para comenzar a usar las sentencias SQL:

`/usr/bin/bteq`

En el login del prompt escribir:
`.logon 127.0.0.1/dbc` ---> logon es el commando de bteq para ingresar a Teradata, despues viene el identificador del servidor, y el userid que es dbc. 

En el prompt del password:
`dbc`



NOTA: BTEQ es la herramienta que sirve para entrar a la línea de comandos SQL y también para ejecutar comandos BTEQ.

Para ver los comandos de BTEQ: 
`.show controls;`
 

###Crear una base de datos y una tabla: 

`CREATE DATABASE datio 
AS PERMANENT = 500000, FALLBACK, BEFORE JOURNAL, 
DUAL AFTER JOURNAL, DEFAULT JOURNAL TABLE=datio.fin_copy;`

Listar las bases de datos para comprobar que se creó la base datio:
`SELECT * FROM DBC.Databases;`

Para usar a una base de datos en particular:
`set session database datio;`

Crear una tabla: 

`CREATE SET TABLE EMPLOYEE ( 
   EmployeeNo INTEGER, 
   FirstName VARCHAR(30), 
   LastName VARCHAR(30), 
   DOB DATE FORMAT 'YYYY-MM-DD', 
   JoinedDate DATE FORMAT 'YYYY-MM-DD', 
   DepartmentNo BYTEINT 
) 
UNIQUE PRIMARY INDEX ( EmployeeNo );`


Insertar datos a la tabla:

`INSERT INTO Employee (
   EmployeeNo, 
   FirstName, 
   LastName, 
   DOB, 
   JoinedDate, 
   DepartmentNo 
)
VALUES ( 
   101, 
   'Mike', 
   'James', 
   '1980-01-05', 
   '2005-03-27', 
   01
);
INSERT INTO Employee (
   EmployeeNo, 
   FirstName, 
   LastName, 
   DOB, 
   JoinedDate, 
   DepartmentNo 
)
VALUES (
102,
'Carlos',
'Nieto',
'1994-01-08',
'2006-08-21',
02
);
INSERT INTO Employee (
   EmployeeNo, 
   FirstName, 
   LastName, 
   DOB, 
   JoinedDate, 
   DepartmentNo 
)
VALUES (
103,
'Martha',
'Sanchez',
'1987-09-20',
'2009-08-21',
01
);
INSERT INTO Employee (
   EmployeeNo, 
   FirstName, 
   LastName, 
   DOB, 
   JoinedDate, 
   DepartmentNo 
)
VALUES (
104,
'Daniel',
'Arenas',
'1982-08-13',
'2001-02-10',
03
);`

Comprobar que se ingresaron los datos:
Primero hay que configurar el tamaño de la terminal para que se desplieguen todas las columnas:
`.set width 250;` 
Select para ver todos los registros:
`select * from employee;`



Para exportar a un archivo la tabla creada:


`.EXPORT REPORT FILE=file_name.csv
.SET RECORDMODE OFF; 
.SET FORMAT OFF ; 
.SET TITLEDASHES OFF; 
.SET SEPARATOR ','; 
SELECT * from employee;
.EXPORT RESET
.LOGOFF
.EXIT`

Comprobar que está el archivo y ver sus contenido
`ls` 
`cat file_name.csv`
