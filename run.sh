#!/bin/bash

if [ -f "/dst/mods/dedicated_server_mods_setup.lua" ]
then
    cp -f dedicated_server_mods_setup.lua dedicated_server_mods_setup.lua.bak
fi

/steam/steamcmd.sh +login anonymous +force_install_dir /dst +app_update 343050 validate +quit

if [ -f "/dst/mods/dedicated_server_mods_setup.lua.bak" ]
then
    cp -f dedicated_server_mods_setup.lua.bak dedicated_server_mods_setup.lua
fi

cd /dst/bin
command=(./dontstarve_dedicated_server_nullrenderer -persistent_storage_root /dst -conf_dir / -cluster cluster)
"${command[@]}" -shard Caves  | sed 's/^/Caves:  /' &
"${command[@]}" -shard Master | sed 's/^/Master: /'