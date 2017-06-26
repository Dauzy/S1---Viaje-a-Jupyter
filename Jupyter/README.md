# Levantar un contenedor de Jupyter con Docker

Lo primero que haremos sera descargar la imagen, para este ejemplo usaremos la imagen [jupyterhub](https://hub.docker.com/r/jupyterhub/jupyterhub/).

* Hacemos un pull para descargar la imagen desde el dockerhub.
```cmd
$ sudo docker pull jupyter/scipy-notebook
```

* Ahora correremos el contenedor, pasandole el puerto y un volumen para que podamos persistir nuestros notebooks.
```
$ sudo docker run sudo docker run --name jupy -it --rm \
-v /path/de/tu/host:/home/jovyan/work \
-p 8888:8888 jupyter/scipy-notebook
```

* Copiamos y vamos a la direccion que nos indica.
![image of cmd](https://github.com/Dauzy/S1---Viaje-a-Jupyter/blob/daniel/Jupyter/figure1.png)

* Creamos un nuevo notebook y ejecutaremos el siguiente ejemplo basico( una serie de 0 a 50)
```python
for i in range(50):
    print(i)
```
![example imaga](https://github.com/Dauzy/S1---Viaje-a-Jupyter/blob/daniel/Jupyter/figure2.png)
