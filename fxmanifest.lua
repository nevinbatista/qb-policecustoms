fx_version 'cerulean'
game 'gta5'

author 'phsycodevs'
description 'Police Vehicle Customization Menu for QBCore'
version '1.0.0'

--[[ Resource Settings ]]--
fx_version 'cerulean'
game 'gta5'
lua54 'yes'

shared_scripts {
    'shared/config.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/server.lua'
}

client_scripts {
    'client/client.lua'
}

dependencies {
    'qb-core',
    'qb-target',
    'qb-menu'
}