#!/bin/bash

# Define the file path
env_file="/path/to/.env"

# Define the variables
cat << EOF > "$env_file"
# Plex Information
TIMEZONE=America/Vancouver
PLEX_CLAIM_ID=id

# Torrent Information
# Note: The user/pw method is deprecated. Go to the link below, go 
#       to Access Token and get your key there instead. Paste it below
#       https://my.nordaccount.com/dashboard/nordvpn/manual-configuration/
VPN_TOKEN=paste_token_here
VPN_CONNECT_LOCATION=United_States # Country [City] (ie. Canada Vancouver)

# Docker Permissions
PUID=1000
GUID=1000

# Drive Location(s)
DRIVE_1=drive_1_location
DRIVE_2=drive_2_location
DRIVE_3=drive_3_location

# Additional Configuration(s)
SUBNET=192.168.1.0/24 # or your own subnet

# Docker Ports
REQUESTRR_PORT=4545
OVERSEERR_PORT=5055
BAZARR_PORT=6767
WHISPARR_PORT=6969
RADARR_PORT=7878
QBITTORRENT_WEB_PORT=8080 # WEBUI
JELLYFIN_PORT=8096
HOMEASSISTANT_PORT=8123
TAUTULLI_PORT=8181
FLARESOLVERR_PORT=8191
TDARR_WEBUI_PORT=8265
TDARR_SERVER_PORT=8266
PLEX_PORT=
LIDARR_PORT=8686
READARR_PORT=8787
SONARR_PORT=8989
PORTAINER_PORT=9443
PROWLARR_PORT=9696
STASH_PORT=9999
EOF
# Display a message
echo "The .env file has been created in $destination_dir. Please make sure to fill in the TIMEZONE, PLEX_CLAIM_ID, VPN_TOKEN, DRIVE_#s, and other necessary items. The _PORTS should be unchanged if using the docker-compose.yml file"
