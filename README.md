# docker-dst

## How to run ?

docker run -ti -v myvolume:/dst/cluster jamendub/dst:latest

## How to configure ?

Inside your volume, go to the 'cluster' folder for world generation and cluster settings and mods

## How to enable mods ?

To enable mods, you'll have to mount at least 1 more volume in read-only fashion :

docker run -ti
-v myvolume:/dst/cluster
-v dedicated_server_mods_setup.lua:/dst/mods/dedicated_server_mods_setup.lua:ro
jamendub/dst:latest

## How to configure mods ?

Inside the dedicated_server_mods_setup.lua file that your mounted, add the required config lines so the mods will
install upon server restart. Read Only is mandatory because on server update it gets reset otherwise...

## How to update ?

Simply restart the container

## What does it do ?

Built on top of jamendub/steam which already packages steamcmd
Install dependencies libcurl4-gnutls-dev:i386 lib32stdc++6
Creates a volume for the cluster config and save file at : /dst/cluster
Populates it with a dummy config that you can easily edit following instructions on the Klei Forums.
Copies a start.sh bash script to install server from Steam CMD and start it when you run the container.

### That's all folks.
