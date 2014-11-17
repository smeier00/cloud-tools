#!/bin/bash

counter=0
devlabel=$( hostname -s | cut -d'-' -f3- )

for dev in `cat $1 |grep -v "#"`; do
    echo "Partitioning device: ${dev}"

    echo "parted /dev/${dev} 'mklabel gpt'"
    parted /dev/${dev} 'mklabel gpt'

    echo "parted /dev/${dev} 'mkpart primary 1 -1'"
    parted /dev/${dev} 'mkpart primary 1 -1'
    #parted /dev/${dev} 'mkpart primary 0 -0'

    echo "parted /dev/${dev} 'print'"
    parted /dev/${dev} 'print'

    while [ ! -e /dev/${dev}1 ]; do
        echo "Waiting for device to be created"
        sleep 1;
    done
done
