#!/bin/bash

/steam/steamcmd.sh +login anonymous +force_install_dir /dst +app_update 343050 validate +quit

if [ -f "/dst/mods/dedicated_server_mods_setup.lua.tpl" ]
then
    cp -f /dst/mods/dedicated_server_mods_setup.lua.tpl /dst/mods/dedicated_server_mods_setup.lua
    echo 'mods config file dedicated_server_mods_setup.lua.tpl copied to dedicated_server_mods_setup.lua'
fi

cd /dst/bin
command=(./dontstarve_dedicated_server_nullrenderer -persistent_storage_root /dst -conf_dir / -cluster cluster)
"${command[@]}" -shard Caves  | sed 's/^/Caves:  /' &
"${command[@]}" -shard Master | sed 's/^/Master: /'