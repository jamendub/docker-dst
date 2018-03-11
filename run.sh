#!/bin/bash

/steam/steamcmd.sh +login anonymous +force_install_dir /dst +app_update 343050 validate +quit

if [ -f "/dst/cluter/mods/dedicated_server_mods_setup.lua.tpl" ]
then
    cp -f /dst/cluter/mods/dedicated_server_mods_setup.lua /dst/mods/dedicated_server_mods_setup.lua
    echo 'mods installation file "dedicated_server_mods_setup.lua" copied to correct directory'
fi

if [ -f "/dst/cluter/mods/modoverrides.lua" ]
then
    cp -f /dst/cluter/mods/modoverrides.lua /dst/cluster/Master/modoverrides.lua
    cp -f /dst/cluter/mods/modoverrides.lua /dst/cluster/Caves/modoverrides.lua
    echo 'mods config file "modoverrides.lua" applied to Master and Caves server'
fi

cd /dst/bin
command=(./dontstarve_dedicated_server_nullrenderer -persistent_storage_root /dst -conf_dir / -cluster cluster)
"${command[@]}" -shard Caves  | sed 's/^/Caves:  /' &
"${command[@]}" -shard Master | sed 's/^/Master: /'
