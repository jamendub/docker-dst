#!/bin/bash

/steam/steamcmd.sh +login anonymous +force_install_dir /dst +app_update 343050 validate +quit

cd /dst/bin
command=(./dontstarve_dedicated_server_nullrenderer -persistent_storage_root /dst -conf_dir / -cluster cluster)
"${command[@]}" -shard Caves  | sed 's/^/Caves:  /' &
"${command[@]}" -shard Master | sed 's/^/Master: /'
