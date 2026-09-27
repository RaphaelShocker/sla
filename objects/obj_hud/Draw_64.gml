if !visible exit;

draw_set_alpha(0.82);
draw_set_color(make_color_rgb(7, 27, 42));
draw_rectangle(24, 20, 270, 92, false);
draw_rectangle(720, 20, 936, 92, false);
draw_set_alpha(1);
draw_set_color(c_white);
draw_rectangle(24, 20, 270, 92, true);
draw_rectangle(720, 20, 936, 92, true);

draw_set_font(fnt_textregular);
draw_text(88, 31, "PING PONG TOWER");
draw_text(88, 56, global.pingpong_stage);

// mini player ball
draw_set_color(make_color_rgb(245, 244, 234));
draw_circle(56, 56, 18, false);
draw_set_color(make_color_rgb(150, 155, 160));
draw_circle(56, 56, 18, true);
draw_set_color(make_color_rgb(220, 90, 45));
draw_circle(61, 60, 2, false);

draw_set_color(c_white);
draw_text(742, 31, "SCORE");
draw_set_font(global.ltfont);
draw_text(814, 55, string(global.collect));
draw_set_font(fnt_textregular);

if global.panic {
	var _col = 255 - panictime_color;
	draw_set_color(make_color_rgb(255, _col, _col));
	var _spacer = global.timer[1] < 10 ? ":0" : ":";
	draw_set_halign(fa_center);
	draw_text(480, timerpos, "MATCH POINT  " + string(global.timer[0]) + _spacer + string(global.timer[1]));
	draw_set_halign(fa_left);
	draw_set_color(c_white);
}

if displaymessage {
	draw_set_halign(fa_center);
	draw_set_color(c_white);
	draw_text(480, 248, msg_text);
	draw_set_halign(fa_left);
}

if hudstate != hudstates.normal hudstate_timer -= 1;
draw_set_color(c_white);
