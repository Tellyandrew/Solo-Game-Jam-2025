draw_clear_alpha(#000000, 1);

draw_sprite_ext(s_thresholdLine, ((global.currentFrame >> 3) & 0b11), 106, TOP_THRESHOLD + TOP_VELOCITY + 1, 1, 1, 0, #00FFFF, 1);