if !global.pingpong_tower exit;

// Deep arena background
var _bg = make_color_rgb(8, 18, 34);
var _blue = make_color_rgb(20, 108, 148);
var _blue2 = make_color_rgb(15, 82, 112);
var _edge = make_color_rgb(235, 245, 250);
var _danger = make_color_rgb(215, 55, 55);
var _hard = make_color_rgb(80, 92, 110);
var _gold = make_color_rgb(245, 190, 55);

draw_set_alpha(1);
draw_set_color(_bg);
draw_rectangle(0, 0, room_width, room_height, false);

// Stadium bands and subtle table-grid atmosphere
for (var _y = 0; _y < room_height; _y += 96) {
	draw_set_alpha(0.08);
	draw_set_color(c_white);
	draw_rectangle(0, _y, room_width, _y + 2, false);
}
for (var _x = 0; _x < room_width; _x += 160) {
	draw_set_alpha(0.04);
	draw_set_color(c_white);
	draw_rectangle(_x, 0, _x + 2, room_height, false);
}
draw_set_alpha(1);

// Collision geometry becomes stylized ping-pong-table surfaces.
with (obj_solid) {
	var _c = _blue;
	switch (object_index) {
		case obj_destroyable:
		case obj_destructible:
		case obj_bigdestroyable:
		case obj_secretdestroyable:
			_c = make_color_rgb(205, 125, 45);
			break;
		case obj_toughblock:
		case obj_secrettough:
			_c = _hard;
			break;
		case obj_panicblock:
		case obj_panicblock_alt:
			_c = make_color_rgb(145, 45, 75);
			break;
	}
	draw_set_color(_c);
	draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, false);
	draw_set_color(_edge);
	draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);

	// White court line on the upper edge.
	draw_set_alpha(0.8);
	draw_line(bbox_left + 2, bbox_top + 2, bbox_right - 2, bbox_top + 2);
	draw_set_alpha(1);
}

with (obj_platform) {
	draw_set_color(_blue2);
	draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, false);
	draw_set_color(_edge);
	draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
	draw_line(bbox_left, bbox_top + 2, bbox_right, bbox_top + 2);
}

with (obj_hurtblock) {
	draw_set_color(_danger);
	draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, false);
	draw_set_color(c_white);
	draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
	for (var _sx = bbox_left + 6; _sx < bbox_right; _sx += 12) {
		draw_triangle(_sx - 5, bbox_top, _sx, bbox_top - 8, _sx + 5, bbox_top, false);
	}
}

// Enemies are training paddles.
with (obj_enemyroot) {
	var _dir = image_xscale == 0 ? 1 : image_xscale;
	draw_set_color(c_black);
	draw_line_width(x, y + 7, x - (18 * _dir), y + 28, 7);
	draw_set_color(make_color_rgb(205, 45, 55));
	draw_ellipse(x - 15, y - 18, x + 15, y + 12, false);
	draw_set_color(c_white);
	draw_ellipse(x - 15, y - 18, x + 15, y + 12, true);
	draw_set_color(c_black);
	draw_circle(x - 5, y - 5, 2, false);
	draw_circle(x + 5, y - 5, 2, false);
}

// Collectibles become little ping-pong balls.
with (obj_collectible_root) {
	draw_set_alpha(0.25);
	draw_set_color(c_black);
	draw_ellipse(x - 6, y + 4, x + 7, y + 9, false);
	draw_set_alpha(1);
	draw_set_color(make_color_rgb(250, 248, 235));
	draw_circle(x, y, 7, false);
	draw_set_color(c_white);
	draw_circle(x - 2, y - 2, 2, false);
	draw_set_color(make_color_rgb(220, 95, 45));
	draw_circle(x + 2, y + 2, 1.5, false);
}

with (obj_detrixie) {
	draw_set_color(_gold);
	draw_ellipse(x - 12, y - 14, x + 12, y + 10, false);
	draw_set_color(c_white);
	draw_ellipse(x - 12, y - 14, x + 12, y + 10, true);
	draw_set_color(make_color_rgb(90, 60, 20));
	draw_line_width(x, y + 8, x + 13, y + 24, 5);
}

with (obj_key) {
	draw_set_color(_gold);
	draw_circle(x, y, 8, true);
	draw_line_width(x + 7, y, x + 22, y, 4);
	draw_line(x + 17, y, x + 17, y + 7);
	draw_line(x + 22, y, x + 22, y + 7);
}

// Arena banner
draw_set_alpha(0.7);
draw_set_color(make_color_rgb(10, 40, 60));
draw_rectangle(16, 16, 250, 46, false);
draw_set_alpha(1);
draw_set_color(c_white);
draw_set_font(fnt_textregular);
draw_text(26, 22, global.pingpong_stage);
draw_set_color(c_white);
