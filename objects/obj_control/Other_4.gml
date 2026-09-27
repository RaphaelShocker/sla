if layer_get_id("Tiles_1") != -1 {
	global.tileset = layer_get_id("Tiles_1")
}

// Hide the original room art while keeping all gameplay/collision objects alive.
var _pp_layers = ["Background", "Assets_1", "Assets", "Tiles_1", "Tiles", "Decor"];
for (var _i = 0; _i < array_length(_pp_layers); _i++) {
	var _layer = layer_get_id(_pp_layers[_i]);
	if (_layer != -1) layer_set_visible(_layer, false);
}

with obj_solid visible = false;
with obj_platform visible = false;
with obj_hurtblock visible = false;
with obj_enemyroot visible = false;
with obj_collectible_root visible = false;
with obj_detrixie visible = false;
with obj_key visible = false;

didpanicsound = global.panic
switch room
{
	case agm_secret1: case agm_secret2:
		checkSecret(room)
		break;
}

if global.panic or room == endscreen exit;
var music_choice = -1

switch room
{
	case hubroom:
		music_choice = d_hub
		global.pingpong_stage = "CLUB HOUSE"
		break;
	case tutorial_1: case tutorial_2: case tutorial_3: case tutorial_4: case tutorial_5: case tutorial_6:
		music_choice = d_tutorial
		global.pingpong_stage = "TRAINING TABLE"
		break;
	case entrance_1: case entrance_2: case entrance_3:
		music_choice = d_entrance
		global.pingpong_stage = "OPEN QUALIFIERS"
		break;
	case chateau_1:
		music_choice = d_chateau
		global.pingpong_stage = "CHAMPIONS TABLE"
		break;
	case agm_1: case agm_2: case agm_3: case agm_4: case agm_5:
		music_choice = d_agm
		global.pingpong_stage = "NEON TABLE"
		break;
	case agm_secret1: case agm_secret2:
		music_choice = d_agmsecret
		global.pingpong_stage = "SECRET RALLY"
		break;
	case armory_1: case armory_left1: case armory_left2: case armory_left3: case armory_right1: case armory_right2: case armory_right3: case armory_right4:
		music_choice = d_military
		global.pingpong_stage = "ROBOT PRACTICE"
		break;
}

if music_choice != -1 scr_playmusic(music_choice)
