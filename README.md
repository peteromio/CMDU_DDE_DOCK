nota: Es un fork CMDU_DDE_DOCK  https://github.com/sonichy/CMDU_DDE_DOCK

### Cambios en esta versión:
* Se agrega soporte para el modo oscuro y el modo claro de deepin 
* Se ha cambiado el metodo de construccion a CMAKE
* Ahora puede distribuirse como deb para deepin

# CMDU_DDE_DOCK

## Descripción

Complemento de la barra de tareas, muestra velocidad de red del sistema Deepin Linux. Al pasar el mouse muestra el tiempo de arranque, el uso de la CPU, el uso de la memoria, los bytes de descarga y los bytes de carga.

![alt](preview.png)

Cuando el uso de la memoria sea superior al 90%, se mostrará en rojo como advertencia. Preste atención a reducir la memoria para evitar bloqueos.

![alt](preview90.png)

## Instalación en Deepin v20
Para instalar en deepin la manera mas sencilla es descargar el `deb` desde el ultimo release aquí:
[Releases](https://github.com/peteromio/CMDU_DDE_DOCK/releases).

## Instalación Manual

### Requerimientos:

`build­-essential dde-dock-dev cmake qtbase5-dev-tools pkg-config libdtkwidget-dev`

### Build e Install Con CMAKE:

Para instalar

``` shell
$ cd /path/to/the/source/
$ mkdir build && cd build
$ cmake ..
$ make
$ sudo make install
$ pkill dde-dock
```
Para desinstalar
``` shell
$ sudo make uninstall
$ pkill dde-dock
```
### Build e Install Con PKG-DEB:

Para instalar
``` shell
$ cd /path/to/the/source/
$ chmod +x build.sh
$ ./build.sh
$ sudo apt install ./cmdu-dock-plugin_3.XX.X-X_amd64.deb
```
Para desinstalar
``` shell
$ sudo apt remove cmdu-dock-plugin

```