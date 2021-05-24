fx_version 'bodacious'
game 'gta5'

description 'vSyncRevamped'
version '1.0.2'

server_scripts {
	'server/server.lua',
	'server/commands.lua'
}

client_script 'client/client.lua'

server_exports {
	'ToggleBlackout',
	'FreezeElement',
}