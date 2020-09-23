#!/bin/bash
factory_fn()
{
    mkdir build
    cd build
    cmake ..
    make
    if [ -d "../pkg/usr/lib/dde-dock/plugins/" ]
    then 
        cp libCMDU.so ../pkg/usr/lib/dde-dock/plugins/
        cd ../
        dpkg -b ./pkg ./cmdu-dock-plugin_3.20.0-0_amd64.deb
    else
        mkdir -p ../pkg/usr/lib/dde-dock/plugins/
        cp libCMDU.so ../pkg/usr/lib/dde-dock/plugins/
        cd ../
        dpkg -b ./pkg ./cmdu-dock-plugin_3.20.0-0_amd64.deb
    fi
}
if [ -d "./build" ] 
then
    rm -rf build
    factory_fn 
else
    factory_fn
fi