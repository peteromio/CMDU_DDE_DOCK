#!/bin/bash
factory_fn()
{
    mkdir build
    cd build
    cmake ..
    make
    cp libCMDU.so ../pkg/usr/lib/dde-dock/plugins/
    cd ../
    dpkg -b ./pkg ./cmdu-dock-plugin_3.20.0-0_amd64.deb  
}
if [ -d "./build" ] 
then
    rm -rf build
    factory_fn 
else
    factory_fn
fi