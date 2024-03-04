#!/bin/bash

# List of ports to allow
ports_to_allow=(
    22
    80
    443
    4545
    5055
    6767
    6969
    7878
    8080
    8096
    8123
    8181
    8191
    8265
    8266
    8686
    8787
    8989
    9443
    9696
    9999
)

# Allow the ports using sudo ufw allow command
for port in "${ports_to_allow[@]}"; do
    sudo ufw allow "$port"
done
