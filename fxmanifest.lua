fx_version 'cerulean'
game 'gta5'

description 'QB-WeatherSync'
version '1.0.0'

server_scripts {
	"server/main.lua",
	"server/commands.lua"
} 

client_scripts {
	"client/main.lua"
}

server_exports {
	'ToggleBlackout',
	'FreezeElement'
}

dependencies {
	'qb-core'
}