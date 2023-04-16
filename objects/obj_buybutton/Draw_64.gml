/// @description Insert description here
// You can write your code in this editor

draw_set_font(fnt_buyfont)
draw_set_halign(fa_center)
draw_set_valign(fa_center)

if mouse_hover {
	draw_set_color(c_yellow)
} else {
	draw_set_color(c_white)
}

draw_text(x, y, "BUY")