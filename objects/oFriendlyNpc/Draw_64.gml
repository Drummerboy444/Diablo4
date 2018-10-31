if (talking) {
	draw_set_alpha(0.5);
	draw_set_color(c_black);
	draw_roundrect(
		textBoxBuffer,
		windowHeight - textBoxBuffer - textBoxHeight,
		windowWidth - textBoxBuffer,
		windowHeight - textBoxBuffer,
		false
	);
	
	draw_set_alpha(1);
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_text(windowWidth / 2, windowHeight - textBoxBuffer - (textBoxHeight / 2), text);
}

draw_set_alpha(1);