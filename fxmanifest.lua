fx_version "cerulean"
game "gta5"
lua54 "yes"

author "Fancazista"
github "https://github.com/Fancazista/"
docs "https://docs.fanca.live/"
discord "https://discord.gg/2JTRHrMs4m/"
tebex "https://fanca.tebex.io/"

name "Anti tank"
description "Make sure that if a player has to die, they die."
version "1.0.0"

shared_scripts {
	"config.lua",
	"@ox_lib/init.lua",
	"shared.lua",
}

server_script "server.lua"
client_script "client.lua"