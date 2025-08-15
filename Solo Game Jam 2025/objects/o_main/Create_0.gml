randomise();

application_surface_draw_enable(false);
surface_resize(application_surface, 320, 192);

global.atStart = true;
global.intro = -1;
global.attemptingIntroMusic = true;

global.currentFrame = -1;
global.upgradeFrame = -1;
global.score = 0;
global.fakeScore = 0;
global.lives = 3;
spawnDifficulty = 1;
spawnQueue = [];
spawnLocation = undefined;
nextReward = 250;
nextRewardIncrement = 250;
nextRewardModulus = 0;
rewardQueue = 0;
music = undefined;

global.lockoutLeft = false;
global.lockoutRight = false;

enum DEPTH{
	ENEMY,
	ENEMY_FAST,
	ENEMY_PROJECTILE,
	PLAYER,
	PLAYER_PROJECTILE,
	UPGRADE,
	UPGRADE_BACKGROUND,
	PARTICLE_IMPORTANT,
	PARTICLE,
}

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
palette_set_colour(PALETTE_INDEX.RED, #FF0000);
palette_set_colour(PALETTE_INDEX.PURPLE, #0F001F);

palette_set_colour(PALETTE_INDEX.GREEN, #00FF00);
palette_set_colour(PALETTE_INDEX.YELLOW, #FF0000);

global.holdingLeft = pressing_left();
global.holdingRight = pressing_right();
global.pressedLeft = false;
global.pressedRight = false;
global.releasedLeft = false;
global.releasedRight = false;
instance_create_depth(53, 192, DEPTH.PLAYER, o_player);

global.playerBulletParticleSystem = part_system_create();
part_system_depth(global.playerBulletParticleSystem, DEPTH.PLAYER_PROJECTILE);
part_system_position(global.playerBulletParticleSystem, 106, 0);
part_system_automatic_update(global.playerBulletParticleSystem, false);

global.starParticleSystem = part_system_create();
part_system_depth(global.starParticleSystem, DEPTH.PARTICLE);
part_system_position(global.starParticleSystem, 106, 0);
part_system_automatic_update(global.starParticleSystem, false);

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

global.gemsExplored = [gem_hash(4, 4)];
global.gunCharge = 0;

global.gemAddGem = global.GEM_EMPTY;
gemAddSlot = undefined;
gemAddOrientation = undefined;
global.gemAddTick = 0;

gemSlotsEmpty = [
            Vec2(1, 0), Vec2(2, 0), Vec2(3, 0), Vec2(4, 0),
Vec2(0, 1), Vec2(1, 1), Vec2(2, 1), Vec2(3, 1), Vec2(4, 1), 
Vec2(0, 2), Vec2(1, 2), Vec2(2, 2), Vec2(3, 2), Vec2(4, 2), 
Vec2(0, 3), Vec2(1, 3), Vec2(2, 3), Vec2(3, 3), Vec2(4, 3), 
Vec2(0, 4), Vec2(1, 4), Vec2(2, 4), Vec2(3, 4),              Vec2(5, 4), Vec2(6, 4), Vec2(7, 4), Vec2(8, 4),
                                                Vec2(4, 5),  Vec2(5, 5), Vec2(6, 5), Vec2(7, 5), Vec2(8, 5),
                                                Vec2(4, 6),  Vec2(5, 6), Vec2(6, 6), Vec2(7, 6), Vec2(8, 6),
                                                Vec2(4, 7),  Vec2(5, 7), Vec2(6, 7), Vec2(7, 7), Vec2(8, 7),
                                                Vec2(4, 8),  Vec2(5, 8), Vec2(6, 8), Vec2(7, 8)
];

gemAddSlot = Vec2_copy(gemSlotsEmpty[irandom(array_length(gemSlotsEmpty) - 1)]);
gemAddOrientation = brandom() ? Vec2(1, 0) : Vec2(0, -1);