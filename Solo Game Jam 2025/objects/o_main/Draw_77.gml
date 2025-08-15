
draw_clear_alpha(palette_get_colour(PALETTE_INDEX.BLUE), 1);
shader_set(a_palettise);
shader_set_uniform_f_array(global.PALETTE_UNIFORM, global.PALETTE);
var _scale = min(floor(window_get_width()/320), floor(window_get_height()/192));
var _xPos = floor((window_get_width() - 320*_scale)/2);
var _yPos = floor((window_get_height() - 192*_scale)/2);
draw_surface_ext(application_surface, _xPos, _yPos, _scale, _scale, 0, c_white, 1);
shader_reset();