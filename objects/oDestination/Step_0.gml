if(image_index == 0){
	visible = false;	
}

if (mouse_check_button_pressed(mb_left)) {
  visible = true;
  image_index = 0;
}

if (mouse_check_button(mb_left)) {
  image_index=max(0,image_index-1);
  x = mouse_x;
  y = mouse_y;
}