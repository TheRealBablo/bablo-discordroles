games {
    "gta5"
}

version "1.0.0"

fx_version "cerulean"

lua54 "yes"

shared_scripts {
    'src/shared/*.lua',
}

server_scripts {
    "config.lua",
    'src/server/*.lua',
}
