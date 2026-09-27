#macro debug false

global.music = audio_play_sound(d_title,-1,true)
global.ltfont = font_add_sprite_ext(spr_font,"1234567890",false,0)
global.dslist = [] // using a DS list was too buggy
global.collect = 0
global.panic = false
global.timer = [2, 30]
global.keys = 0

global.tileset = noone // used for secret destructibles

global.detrixies = [0, 0, 0, 0, 0]
global.secrets = [] // stores secret rooms the player visited'

global.camshake = [0, 0]
global.camshake_xdir = 1

panictimer = 60
panictimespent = 0 // used for screen shake
didpanicsound = false

camxoffset = 0

// Ping Pong Tower theme
global.pingpong_tower = true
global.pingpong_rally = 0
global.pingpong_stage = "TABLE ARENA"
depth = 100000

if debug {
	lastkey = noone
	show_debug_overlay(true)
}

#region enums

enum afterimages {
	perpendicular,
	stationary
}

#endregion
#region functions

function checkSecret(input) {
	if !array_find(global.secrets, input) {
		array_push(global.secrets, input)
		if instance_exists(obj_message) instance_destroy(obj_message)
		with instance_create_layer(0, 0, "Instances", obj_message) {
			text = "You found " + string(array_length(global.secrets)) + " secret table" + (array_length(global.secrets) != 1 ? "s" : "") + "!"
		}
	}
}

#endregion
#region rank-related

global.rank_req = 10000
global.secret_req = 6
global.detrixie_req = 5
global.timeshurt = 0
#endregion
