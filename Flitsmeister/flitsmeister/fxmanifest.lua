fx_version 'adamant'

game 'gta5'

author 'frz_7999'

description 'Flistmeister script | Frz Service |  https://discord.gg/PbYWpsaEne'

version '1.1.0'

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    '@es_extended/locale.lua',
    'config.lua',
}

client_scripts {
    '@es_extended/locale.lua',
    'config.lua',
    'client/client.lua'
}

shared_script '@es_extended/imports.lua'
