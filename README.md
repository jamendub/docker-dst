# docker-dst

### How to configure ?

When you will run the container, there will be a *cluster* volume for world generation and cluster settings and mods.
Inside that volume, you can put the configurations as they are described on other websites link this one :

https://forums.kleientertainment.com/topic/64441-dedicated-server-quick-setup-guide-linux/

Here is my list of files to give you an idea

>*cluster*<br/>
-- Caves<br/>
---- modoverrides.lua<br/>
---- server.ini<br/>
---- worldgenoverride.lua<br/>
-- Master<br/>
---- modoverrides.lua<br/>
---- server.ini<br/>
---- worldgenoverride.lua<br/>
-- cluster.ini<br/>
-- cluster_token.txt

### How to run ?

docker run -ti -v *configvolume*:/dst/cluster jamendub/dst:latest

### How to configure mods ?

Inside the *mod* volume you have to put some files in order to download the mods when the server restarts.

Here is an example of my files (for detailed config go to the game forums/wikis) :

https://forums.kleientertainment.com/topic/64441-dedicated-server-quick-setup-guide-linux/

>*mods*<br/>
-- dedicated_server_mods_setup.lua<br/>
-- modsettings.lua

### How to enable mods ?

First you have to make sure that in the *configvolume* you put the configuration files described above.
Then you can run the container this way so it takes the mods config in consideration.

**docker run -ti
-v *configvolume*:/dst/cluster
-v modvolume:/dst/mods
jamendub/dst:latest**

### How to update/restart ?

Simply restart the container.

### How does it works (under the hood) ?

Built on top of jamendub/steam which already packages steamcmd<br/>
Automatically installs dependencies : libcurl4-gnutls-dev:i386 lib32stdc++6<br/>
Also creates a volume for the cluster config and save file at : /dst/cluster<br/>
Populates it with a dummy config that you can easily edit following instructions on the Klei Forums.<br/>
Copies a start.sh bash script to install server from Steam CMD and start it when you run the container.<br/>


#### That's all folks.
