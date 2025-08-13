shader_set(a_palettise);
shader_set_uniform_f_array(global.PALETTE_UNIFORM, global.PALETTE);
draw_surface_ext(application_surface, 0, 0, window_get_width()/320, window_get_height()/192, 0, c_white, 1);
shader_reset();