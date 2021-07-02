fx_version 'bodacious'
game 'gta5'

description 'vSyncRevamped'
version '1.0.2'

shared_scripts { 
	'@qb-core/import.lua',
	'config.lua',
}

server_scripts {
	'locale.lua',
	'locales/en.lua',
	'server/server.lua'
}

client_scripts {
	'locale.lua',
	'locales/en.lua',
	'client/client.lua'
}
