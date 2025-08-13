application_surface_draw_enable(false);
surface_resize(application_surface, 320, 192);

global.currentFrame = -1;

global.PALETTE_UNIFORM = shader_get_uniform(a_palettise, "palette_LUT");
enum PALETTE_INDEX{
	BLACK,
	RED,
	GREEN,
	YELLOW,
	BLUE,
	PURPLE,
	CYAN,
	WHITE,
	
	TOTAL
}

global.PALETTE = array_create(PALETTE_INDEX.TOTAL*3);

palette_set_colour(PALETTE_INDEX.WHITE, #FFFFFF);
palette_set_colour(PALETTE_INDEX.BLUE, #000013);
palette_set_colour(PALETTE_INDEX.CYAN, #00FFFF);
palette_set_colour(PALETTE_INDEX.BLACK, #0F001F);

global.holdingLeft = pressing_left();
global.holdingRight = pressing_right();
global.pressedLeft = false;
global.pressedRight = false;
instance_create_depth(53, 192 - 14, 0, o_player);

global.playerBulletParticleSystem = part_system_create();
part_system_depth(global.playerBulletParticleSystem, 100);
part_system_position(global.playerBulletParticleSystem, 106, 0);
part_system_automatic_update(global.playerBulletParticleSystem, false);

#macro MINI_FONT_MAP " 1234567890$ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz=-+!.,☺☻/|[]"
global.miniFont = font_add_sprite_ext(s_font, MINI_FONT_MAP, true, 1);
draw_set_font(global.miniFont);

global.upgrading = false;

global.gemGrid = array_create_ext(9, function(){
	return array_create_ext(9, function(){
		return {
			charge : 0,
			gem : global.GEM_EMPTY,
		};
	});
});
global.gemGrid[0][0].gem = global.GEM_GUN_LEFT;
global.gemGrid[4][4].gem = global.GEM_GUN_MIDDLE;
global.gemGrid[8][8].gem = global.GEM_GUN_RIGHT;

global.gemsExplored = new GemSearchNode(gem_hash(4, 4));
global.gunCharge = 0;

global.gemAddGem = global.GEM_EMPTY;
global.gemAddLocationX = 4;
global.gemAddLocationY = 4;