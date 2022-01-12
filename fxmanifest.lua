fx_version 'cerulean'
game 'gta5'

description 'vSyncRevamped'
version '1.0.2'

shared_scripts {
	'config.lua',
        '@qb-core/shared/locale.lua',
	'locales/*.lua'
}

server_script 'server/server.lua'
client_script 'client/client.lua'

lua54 'yes'
