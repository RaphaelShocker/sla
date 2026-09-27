if !visible exit;

if state == states.taunt {
	draw_set_alpha(0.35);
	draw_set_color(c_white);
	draw_circle(x, y, 38, false);
	draw_set_alpha(1);
}

var _speed = point_distance(0, 0, hsp, vsp);
var _rx = 18;
var _ry = 18;

if state == states.grab or state == states.run {
	_rx += min(8, abs(hsp) * 0.45);
	_ry -= min(5, abs(hsp) * 0.20);
}
if state == states.superjump {
	_rx = 14;
	_ry = 25;
}
if crouched {
	_rx = 21;
	_ry = 13;
}

// Motion trail at high speed.
if (_speed > 6 or state == states.grab or state == states.run) {
	for (var _i = 3; _i >= 1; _i--) {
		var _a = 0.06 * (4 - _i);
		draw_set_alpha(_a);
		draw_set_color(make_color_rgb(235, 245, 250));
		draw_ellipse(
			x - hsp * _i * 1.4 - _rx,
			y - vsp * _i * 0.5 - _ry,
			x - hsp * _i * 1.4 + _rx,
			y - vsp * _i * 0.5 + _ry,
			false
		);
	}
}

draw_set_alpha(0.22);
draw_set_color(c_black);
draw_ellipse(x - _rx + 3, y + _ry - 2, x + _rx + 7, y + _ry + 8, false);

draw_set_alpha(1);
var _ballcol = invuln ? make_color_rgb(255, 225, 110) : make_color_rgb(245, 244, 234);
draw_set_color(_ballcol);
draw_ellipse(x - _rx, y - _ry, x + _rx, y + _ry, false);

draw_set_color(make_color_rgb(150, 155, 160));
draw_ellipse(x - _rx, y - _ry, x + _rx, y + _ry, true);

// Ping-pong ball highlight and tiny logo mark.
draw_set_color(c_white);
draw_ellipse(x - _rx * 0.55, y - _ry * 0.62, x - _rx * 0.15, y - _ry * 0.20, false);
draw_set_color(make_color_rgb(220, 90, 45));
draw_circle(x + _rx * 0.26, y + _ry * 0.18, 2.4, false);

if state == states.run and statevars[0] >= 12 {
	draw_set_alpha(0.75);
	draw_set_color(c_white);
	draw_line_width(x - _rx - 20 * image_xscale, y - 8, x - _rx - 4 * image_xscale, y - 8, 2);
	draw_line_width(x - _rx - 28 * image_xscale, y + 1, x - _rx - 8 * image_xscale, y + 1, 2);
	draw_line_width(x - _rx - 18 * image_xscale, y + 10, x - _rx - 2 * image_xscale, y + 10, 2);
	draw_set_alpha(1);
}

if !debug exit;
draw_set_color(c_lime);
draw_point(x + 25 * sign(hsp), y);
if showcol draw_sprite(mask_index, 0, x, y);
if showdebug {
	draw_set_font(fnt_textregular);
	var _d = 1;
	for (var _j = 0; _j < array_length(statevars); _j++) {
		if statevars[_j] != 0 {
			draw_text(x - 64, (y - 128) + 16 * _d, string(statevars[_j]));
			_d++;
		}
	}
}
