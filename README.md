# How to setup an automated HTPC

## Services 
The following services are used to create the HTPC. It uses Plex (or Jellyfin) as the media manager, using the Servarr services to automate renaming and pulling new shows (Sonarr), movies (Radarr), music (Lidarr), and books (Readarr). Subtitles (Bazarr) will be added automatically too! All of this will automatically pull data using torrents (QBitTorrent) using NordVPN as the main VPN service. You can add requests with Overseerr and Requestrr that uses a Discord Bot to add your requests. Tautulli will be used to assist monitoring and analyzing Plex's usages. Everything will be built and done using dockerized containers so that you can launch the setup in any machine and do basic (very much manual) configuration for the app integrations.
/todo: learn how to use Usenet and add integration there as well.
/todo: create an automation script to allow user to select which services they want (ie. I only want movies and shows being renamed, I will download my content on my own --> use only Radarr and Sonarr)
- Media Manager - Plex
-- Tautulli
- Servarr Applications
-- Prowlarr
-- Sonarr
-- Radarr
-- Readarr
-- Lidarr
-- Bazarr
-- Overseerr
-- Requestrr
-- //todo: add Tdarr
- NordVPN
- QBitTorrent

## Install Instructions
### Linux Environment (Ubuntu)
#### Install Pre-requisites
1. Install Linux
2. Install docker
3. Install docker-compose
4. Update Ubuntu

#### Create Folder and Files
Create directories like so (best practice according to community)
- ${ROOT_DIR}/config
- ${ROOT_DIR}/data/{torrents,media/{books,movies,music,tvshows,<other>},<other>}
- ROOT_DIR is set in the .env file. The following folder structure will look like the following:`${ROOT_DIR}`
-- /todo: create a python script to automate creating folders in a ROOT_DIR
ROOT_DIR
  ├─config
  └─data
    ├── downloads
    └── media
        ├── books
        ├── movies
        ├── music
        ├── tvshows
        └── <other>

1. In ${ROOT_DIR}/config, create ".env" and "docker-compose.yml" files. 
- These have been attached already.
2. Edit the .env and fill in what is needed. 
3. Edit the docker-compose.yml file and fill in what is needed.
4. When in doubt, set your user priveledges.
`sudo chown -R $USER:$USER /folder`
`sudo chmod -R 777 /folder`
- note: if you have more knowledge with permissions, as long as docker can use your containers and edit files or create folders, do your own permissions. To keep it (not-so-safe) failsafe, just give the entire root folder 777 priveledges (read, write, execute for all users and groups).

#### Configure .env
1. Set your TIMEZONE
2. Set your PLEX_CLAIM
3. Set your ROOT_DIR
4. Set your PUID/PGID
5. Set your VPN USER/PASSWORD/LOCATION.
- note: your PW is going to be in plain text.
6. If you know how to deal with your ports, and want them dynamic, change them here 

#### Configure docker-compose.yml
1. Under vpn>environment, set the NETWORK to your `${SUBNET}`. 
- may need to check your IP address on your Linux machine
-- use `ifconfig` to get your IP address
2. Change any ports as you see fit. Recommend to keep ports default!

#### Run The Containers
1. Go to `${ROOT_DIR}/config` and save your `.env` and `docker-compose.yml` files here.
2. Run the `docker-compose.yml` file by typing in the following:
- `docker-compose up -d`
-- this will run all your containers in a detached mode (read more on detached mode)
3. When all containers are up and running, type in the following to confirm:
- docker-compose logs
-- this will show all the init logs from all of your containers. Verify there are 
no errors
-- recommend to verify the vpn container works. It will look like the following:

...
...
Connecting to United States #<redactacted> (us<redactacted>.nordvpn.com)
You are connected to United States #<redactacted> (us<redactacted>.nordvpn.com)!
############################################################
vpn  | __  .___  ___. .______     ______   .______     .___________.    ___      .__   __. .___________.
vpn  | |  | |   \/   | |   _  \   /  __  \  |   _  \    |           |   /   \     |  \ |  | |           |
vpn  | |  | |  \  /  | |  |_)  | |  |  |  | |  |_)  |   `---|  |----`  /  ^  \    |   \|  | `---|  |----`
vpn  | |  | |  |\/|  | |   ___/  |  |  |  | |      /        |  |      /  /_\  \   |  . `  |     |  |
vpn  | |  | |  |  |  | |  |      |  `--'  | |  |\  \----.   |  |     /  _____  \  |  |\   |     |  |
vpn  | |__| |__|  |__| | _|       \______/  | _| `._____|   |__|    /__/     \__\ |__| \__|     |__|
vpn  | ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
vpn  | Please migrate to the NordLynx container (https://github.com/bubuntux/nordlynx)
vpn  | Here is your private Key: <REDACTED>
vpn  | IP: <REDACTED>
vpn  | ############################################################
...
...

#### Check Your Containers
1. Open an Internet browser (Firefox, Chrome, etc.)
2. Go to nordvpn.com to verify you're 'protected' using your VPN
3. Go to "<IP of the machine>:8080" to verify QBitTorrent is working
4. Go to "<IP of the machine>:9696" to verify Prowlarr is working
5. Go to "<IP of the machine>:8989" to verify Sonarr is working
6. Go to "<IP of the machine>:7878" to verify Radarr is working
7. Go to "<IP of the machine>:8787" to verify Readarr is working
8. Go to "<IP of the machine>:8686" to verify Lidarr is working
9. Go to "<IP of the machine>:6767" to verify Bazarr is working
10. Go to "<IP of the machine>:5055" to verify Overseerr is working
11. Go to "<IP of the machine>:4545" to verify Requestrr is working
12. Go to "<IP of the machine>:32400" to verify Jellyfin is working
13. Go to "<IP of the machine>:32400" to verify Plex is working
14. Go to "<IP of the machine>:8181" to verify Tautulli is working

#### Configuring Containers
##### Prowlarr
1. Create a login. KISS. 
2. Go to Indexers and add a couple of indexers of your choosing. I saved these ones and used default settings.
- rarbg
- tpb
- 1337x
- kickasstorrents
3. Go to Settings > Apps and add some applications (ServaRR apps!).
- Sonarr, Radarr, Lidarr, etc.
-- Use http://<host_name>:<port> instead of http://localhost:<port>
-- Grab the API key from their respective applications under Settings > General > API_KEY
-- Recommend to do 1 at a time so there is no confusion in the steps. Fortunately, after the first one, the rest are similar in steps.
##### Radarr
1. Go to Settings > Media Management
2. Select any settings you wish to choose.
3. Add a root folder (ie. /data/media/movies)
- Make sure you're following the data structure suggested above. The reason for this is to allow for copying hardlinks to your media location instead of copying a file, and deleting the old file.
4. Save your progress.
5. Go to Settings > Download Clients
6. Add QBitTorrent to the list
- Name: QBitTorrent
- host: <ip_of_machine>
- port: 8080 (this is your `WEB_PORT` set in the docker compose)
- user: admin (default)
- pw: adminadmin (default)
7. Add a Remote Path Mappings 
- host: <ip_of_machine>
- remote path: <path of downloads from QBitTorrent> (ie. /downloads)
- local path: <path of data set from local server (ie. host's system and not the container's system)> (ie. /data/downloads/movies)
-- this is here Radarr saves the downloads from QBittorrent
- Recommend to follow paths above to keep this simple as well.
8. Verify all settings are correct, and check under Systems tab that there are no issues that Radarr can identify. The events tab should be enough to give you an idea of what can go wrong.
##### Sonarr
1. Follow steps from Radarr
##### Readarr
1. Follow steps from Radarr
##### Lidarr
1. Follow steps from Radarr
##### QBitTorrent
1. Go to Settings > Web UI and under the Web UI Remote Control, 
set the IP Address=* and Port="8080"
- If anything goes wrong, you can go into the config/qBittorrent.conf
file and change setting there too.
2. Go to Advanced Settings and select your Network Interface Card to (Nord)VPN
3. Save and go back to Servarr apps to reconfigure the download clients
##### Bazarr
1. Follow steps from Radarr
2. Recommend to use OpenSubtitles (Free). You'll need to create an OpenSubtitles.org account. Free users are limited to 200 downloads/day.
3. Under Settings, set up anything you deem necessary. 
4. Under Languages, you'll need to set up your language profile. For me, I only need english subtitles, so this is easy! Make sure to toggle Movies and Series (Radarr and Sonarr) and apply your profile.
5. Under Providers, this is where you should add your OpenSubtitles. I also recommend to use Embedded Subtitles along with any other services you deem necessary.
6. Under Subtitles, add the files Alongside Media File (as Plex and Jellyfin both like it this way). Set anything else you deem necessary.
7. Under Radarr, input the IP and Port of Radarr's docker instance and grab the API_KEY from Radarr as well. Set the score of your subtitles; the higher the more reliable the source is. I set mine to 75/100.
8. Follow Radarr's setup for Sonarr as well. Here I also disabled Anime Series Types as those are usually embedded with subs anyways.
9. Change any other settings you deem necessary, or just leave the rest default.
##### Overseerr
1. Run through the setup they provide. Create a login if not already created.
2. Add Radarr and Sonarr using their respective IP and Ports along with their API_KEYs as well. 
2. Create additional users if necessary or when needed!
##### Requestrr
Follow the instructions here: https://github.com/darkalfx/requestrr/wiki
1. You'll need Discord to use the bot.
2. Go to https://discord.com/developers/applications
3. On the Applications Tab, select "New Application"
4. Under the new application, copy the "APPLICATION ID" and place it in the Requesterr "Application Id" field.
5. Go back to the Discord Dev Portal, on the Bot Tab, select "Add Bot"
6. Enable under Priveleged Gateway Intents the "Presence Intent" and "Server Members Intent"
7. Generate a token if not already generated and copy and paste it in Requestrr's "Bot Token" field
8. Test Settings, and if all is well, Save everything in Requesttr
9. Create a server if not already made
10. Copy the Invite Link in Requestrr and paste it in your browser. This will add the bot to your server.
11. Verify the bot was added in your server.
12. In Requestrr, under Movies/TV Shows, configure where the requests go. Recommend to use Overseerr as the hub to request to Radarr and Sonarr. 
13. To configure Overseerr as the Download Client, grab the API key from Overseer > Settings > General > API_KEY and and paste it back in Requestrr. 
14. Add the <IP of Overseer> and <Port of Overseerr>
15. (Optional) Create a Default Overseerr user to flow all requests to that user (ie. Requester_User)
16. Test settings and finally save everything. 
17. Create a category for your movies and/or tv shows. Recommended to restrict requests for small servers.  
18. Test the bot! Use `/ping` to ping the bot. It should reply "Pong"
##### Plex
1. Follow the instructions they provide. It should be fairly straight forward so long as you created the paths correctly like above.
##### Tautulli //todo: get Tautulli to work
##### Tdarr //todo: get Tdarr to work


#### Resources
- https://github.com/Luctia/ezarr
- https://github.com/bubuntux/nordvpn/issues/199
- https://trash-guides.info/
- https://github.com/sebgl/htpc-download-box
- https://hub.docker.com/


#### Other Server / Docker Containers

##### Pihole. Netword-Wide Ad-Blocker
1. Copy the docker compose from https://github.com/pi-hole/docker-pi-hole#readme
2. I setup in host only using a laptop on my LAN network that runs docker containers. For the following settings, they are using that setup. 
3. Using the default configuration, delete the following (as we're not using a dhcp server):
- ports -> 67:67/udp
- cap_add -> NET_ADMIN
4. Create a WEBPASSWORD. Recommend to update your .env file for this.
5. Change the TZ to your local timezone. Recommend to update your .env file for this.
6. Change your volumes to locate to a directory of our choice. In my setup, I use ${ROOT_DIR}/config/pihole/...
7. You may need to change the local port 80:80 to something else not in use. I used 8001 (ie. 8001:80/tcp)
8. Save and run the docker compose.
9. If there is an error suggesting port 53 is in use, do the following:
- sudo systemctl stop systemd-resolved
- sudo systemctl disable systemd-resolved
10. Edit the nameserver to use a new nameserver such as Google's or CloudFlares'
- sudo nano /etc/resolv.conf
- nameserver 8.8.8.8 (or 1.1.1.1)
- comment out the old nameserver (ie. # nameserver 127.0.0.53)
11. Restart the pihole docker container.
12. Log in to your web UI by going to either http://pi.hole/admin (if local) or http://<ip_of_pihole>:8001/admin. In my case, it was htpp://192.168.50.58:8001/admin. Once there, login using your WEBPASSWORD you created from earlier
13. Pihole is up and running. Now let's connect it to your router for network-wide ad blocking or as per-device.
14. Go to your Router settings. I am using an Asus Router, so I would go to http://router.asus.com and login. Once logged in, I would go to WAN > Internet Connection and under WAN DNS Settings, I would change the DNS Server1 to <ip_of_pihole>. 
- https://www.asus.com/support/FAQ/1046062/
- For other routers, it should be the same. Just google "pihole your_router dns settings" and it should quickly come up. 
- You may want to backup your old router configuration in case you mess anything up.
15. (Optional): Set up your device's DNS server in connection settings. For the DNS Server, it is the <ip_of_pihole> once again.
- If you did this network-wide, you should be fine to skip this.
