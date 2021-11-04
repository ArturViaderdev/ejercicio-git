# testdam
Ejercicio git
Creo un nuevo repositorio GitHub
![1](https://user-images.githubusercontent.com/53495320/75796083-72fc9700-5d73-11ea-8cca-8e11c250cba9.png)

![2](https://user-images.githubusercontent.com/53495320/75796082-72fc9700-5d73-11ea-9cf0-cbafea3f6f95.png)
Invito al compañero al repositorio

![3](https://user-images.githubusercontent.com/53495320/75796080-72640080-5d73-11ea-8b3e-b60e43438889.png)

También entro yo al repositorio que ha creado el compañero después de haber sido invitado.

Ahora tengo que subir un proyecto a mi repositorio. El compañero también subirá un proyecto al suyo.

![4](https://user-images.githubusercontent.com/53495320/75796078-72640080-5d73-11ea-8bd0-71209b3796f1.png)

Hago un git init para inicializar el repositorio local.

Ahora especifico la url del proyecto con:
git remote add origin git@github.com:ArturViaderMataix/testdam.git

![5](https://user-images.githubusercontent.com/53495320/75796076-71cb6a00-5d73-11ea-8394-df851068e0ec.png)

Ahora descargo el fichero readme que se ha creado al crear el repositorio.
Hago git pull origin master

![6](https://user-images.githubusercontent.com/53495320/75796073-71cb6a00-5d73-11ea-9cfa-722148289423.png)

Añado los archivos del proyecto para subirse con git add .
Preparo para subir los archivos con git commit -m “Subo proyecto”

![7](https://user-images.githubusercontent.com/53495320/75796070-7132d380-5d73-11ea-9ff5-9047ab8bd5fd.png)

Ahora subo los archivos con:
git push --set-upstream origin master

![8](https://user-images.githubusercontent.com/53495320/75796069-7132d380-5d73-11ea-941b-23fc78c6120b.png)

Ahora creo una nueva rama develop con:
Git checkout -b develop

![9](https://user-images.githubusercontent.com/53495320/75796068-7132d380-5d73-11ea-8724-9d4e9bbc899d.png)

Ahora voy a hacer varios commit.
Hago cambios en el proyecto y luego git add .
Git commit -m “Cambios 1”

git push --set-upstream origin develop

Repito esto varias veces creando 4 commits

![10](https://user-images.githubusercontent.com/53495320/75796066-709a3d00-5d73-11ea-91ef-3f31c0eefb5a.png)

Para asegurarme que se ha subido todo pongo
Git push origin develop

Ahora vuelvo a rama master con git checkout origin master

![11](https://user-images.githubusercontent.com/53495320/75796062-709a3d00-5d73-11ea-8b36-e21dc5fcba94.png)

He hecho varias modificaciones todas válidas en diferentes lugares del código.
Cuando se valida que el código es correcto se publica en la rama master haciendo una fusión de ramas. Con git merge develop.

	⁃	Ahora para que los cambios se hagan efectivos en la rama master pongo git push origin master

![12](https://user-images.githubusercontent.com/53495320/75796059-7001a680-5d73-11ea-83c5-aea883b2b464.png)

El compañero se descarga mi proyecto.

Ahora realizo modificaciones al proyecto. El compañero también modificará la misma linea en mi proyecto para generar un problema de versiones.

![13](https://user-images.githubusercontent.com/53495320/75796058-7001a680-5d73-11ea-8297-56ac16b5fe3e.png)

![14](https://user-images.githubusercontent.com/53495320/75796055-6f691000-5d73-11ea-8835-2f6417d0b330.png)

He modificado una linea y he subido los cambios con: git add . | git commit -m “Cambiada linea” | git push origin master

![15](https://user-images.githubusercontent.com/53495320/75796052-6ed07980-5d73-11ea-8b4f-0f0750460f1f.png)

El compañero también ha modificado la misma linea y al intentar subir los cambios ha tenido que seleccionar las lineas válidas.

![18](https://user-images.githubusercontent.com/53495320/75798346-b99fc080-5d76-11ea-8501-f08ae612f321.png)

Después de esto le han aparecido en el proyecto las dos lineas y el ha decidido dejar las dos.

Ha hecho git add . | git commit y git push origin master

![16](https://user-images.githubusercontent.com/53495320/75798222-8fe69980-5d76-11ea-9a81-8e036a5ac468.png)

![17](https://user-images.githubusercontent.com/53495320/75798216-8d843f80-5d76-11ea-9219-0c4138cdc0d5.png)



