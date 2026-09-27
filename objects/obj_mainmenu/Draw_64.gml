// Ping Pong Tower title
draw_set_halign(fa_center);
draw_set_font(fnt_textregular);

draw_set_alpha(0.9);
draw_set_color(make_color_rgb(7, 25, 42));
draw_rectangle(250, 58, 710, 206, false);
draw_set_alpha(1);
draw_set_color(c_white);
draw_rectangle(250, 58, 710, 206, true);

draw_text_transformed(480, 86, "PING PONG", 2.2, 2.2, 0);
draw_text_transformed(480, 135, "TOWER", 2.8, 2.8, 0);

// decorative paddles and ball
draw_set_color(make_color_rgb(205, 45, 55));
draw_ellipse(282, 92, 326, 142, false);
draw_set_color(c_white);
draw_ellipse(282, 92, 326, 142, true);
draw_set_color(make_color_rgb(60, 35, 22));
draw_line_width(320, 134, 344, 160, 8);

draw_set_color(make_color_rgb(245, 244, 234));
draw_circle(660, 116, 14, false);
draw_set_color(make_color_rgb(150, 155, 160));
draw_circle(660, 116, 14, true);

draw_set_color(c_white);
switch curmenu
{
	case menutype.options:
		var theStuff = [
			"Video",
			"Audio",
			"Effects",
			"Back"
		]
		for (var i = 0; i < array_length(theStuff); i++) {
			draw_set_color(select == i ? c_red : c_white)
			draw_text(480, 260 + 32 * i, theStuff[i])
		}
		break;
	case menutype.options_video:
		var screenres
		switch global.resolution
		{
			case 1: default:
				screenres = "960x540"
				break;
			case 2:
				screenres = "1280x720"
				break;
			case 3:
				screenres = "1600x900"
				break;
			case 4:
				screenres = "1920x1080"
				break;
		}
		var theStuff = [
			"Fullscreen: " + string(global.fullscreen),
			"Screen Resolution: " + screenres,
			"Back"
		]
		for (var i = 0; i < array_length(theStuff); i++) {
			draw_set_color(select == i ? c_red : c_white)
			draw_text(480, 260 + 32 * i, theStuff[i])
		}
		break;
	case menutype.options_audio:
		var theStuff = [
			"Sound Volume: " + string(global.sfxvol),
			"Music Volume: " + string(global.musvol),
			"Back"
		]
		for (var i = 0; i < array_length(theStuff); i++) {
			draw_set_color(select == i ? c_red : c_white)
			draw_text(480, 260 + 32 * i, theStuff[i])
		}
		break;
	case menutype.options_fx:
		var theStuff = [
			"Particles: " + getToggled(global.particles),
			"Panic Shake: " + getToggled(global.panicshake),
			"Use Gamepads: " + getToggled(global.gamepad),
			"Back"
		]
		for (var i = 0; i < array_length(theStuff); i++) {
			draw_set_color(select == i ? c_red : c_white)
			draw_text(480, 260 + 32 * i, theStuff[i])
		}
		break;
	case menutype.cleardata:
		draw_set_color(c_white)
		draw_text(480, 192, "Are you sure?")
		for (var i = 0; i < array_length(curopt); i++) {
			draw_set_color(select == i ? c_red : c_white)
			draw_text(480, 260 + 32 * i, curopt[i])
		}
		break;
	default:
		for (var i = 0; i < array_length(curopt); i++) {
			draw_set_color(select == i ? c_red : c_white)
			draw_text(480, 260 + 32 * i, curopt[i])
		}
		break;
}
draw_set_halign(fa_left);
draw_set_color(c_white);
