# Don't Starve Together linux Dedicated Server

Setup easily a linux dst server with you own settings via docker


### How to configure ?

When you will run the container, there will be a *cluster* volume for world generation and cluster settings and mods.
Inside that volume, you can put the configurations as they are described on other websites link this one :

https://forums.kleientertainment.com/topic/64441-dedicated-server-quick-setup-guide-linux/

Here is my list of files to give you an idea :

>*cluster*\
-- cluster.ini\
-- cluster_token.txt\
-- *Caves*\
---- modoverrides.lua\
---- server.ini\
---- worldgenoverride.lua\
-- *Master*\
---- modoverrides.lua\
---- server.ini\
---- worldgenoverride.lua

If your container does not start that means config is wrong !
Check out logs to debug your config ;)

### How to run ?

>**docker run -ti -v *cluster*:/dst/cluster jamendub/dst:latest**

### How to enable mods ?

Inside the *cluster* volume you can setup a mods directory.
You can put 2 files to configure and enable mods that will be copied during startup in their correct spot (the /dst/mods directory).
Here is an example of my files (for detailed config go to the game forums/wikis) :

https://forums.kleientertainment.com/topic/63723-guide-how-to-installconfigure-and-update-mods-on-dedicated-server/

-- *mods*\
---- dedicated_server_mods_setup.lua\
---- modoverrides.lua


If your container does not start that means config is wrong !
Check out logs to debug your config ;)

### How to update/restart ?

Simply restart the container.

### How does it work (under the hood) ?

Built on top of jamendub/steam which already packages steamcmd
Automatically installs dependencies : libcurl4-gnutls-dev:i386 lib32stdc++6
Also creates a volume for the cluster config and save file at : /dst/cluster
Populates it with a dummy config that you can easily edit following instructions on the Klei Forums.
Copies a start.sh bash script to install server from Steam CMD and start it when you run the container.


#### That's all folk, good game !
