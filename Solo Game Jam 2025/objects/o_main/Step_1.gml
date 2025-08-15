if keyboard_check_pressed(vk_anykey) or mouse_check_button_pressed(mb_any){
	global.atStart = false;
}

if global.atStart{
	exit;
}
if global.attemptingIntroMusic{
	if audio_sound_is_playable(u_songIntro){
		audio_play_sound(u_songIntro, 1000, false);
		global.attemptingIntroMusic = false;
	}
}
++global.intro;

if not global.upgrading{
	if global.score >= nextReward{
		nextReward += nextRewardIncrement;
		if ++nextRewardModulus & 0b11 == 0b11{
			nextRewardIncrement += 250;
		}
		rewardQueue++;
	}
	if global.currentFrame & (128 - 1) == 0{
		if rewardQueue > 0 and array_length(gemSlotsEmpty) > 0{
			var _gemLeft = global.GEM_POOL[irandom(array_length(global.GEM_POOL) - 1)];
			var _gemRight;
			do{
				_gemRight = global.GEM_POOL[irandom(array_length(global.GEM_POOL) - 1)];
			}until (_gemRight != _gemLeft);
			
			var _xLeft = irandom_range(1, 23);
			var _xRight = 107 - 21 - _xLeft;
			var _upgradeLeft = instance_create_depth(_xLeft, -21, DEPTH.UPGRADE, o_upgrade)
			var _upgradeRight = instance_create_depth(_xRight, -21, DEPTH.UPGRADE, o_upgrade);
			var _connector = instance_create_depth(floor(mean(_xLeft, _xRight)), -21, DEPTH.UPGRADE_BACKGROUND, o_connector);
			with _upgradeLeft{
				gem = _gemLeft;
				connector = _connector;
				tick = global.currentFrame;
			}
			with _upgradeRight{
				gem = _gemRight;
				connector = _connector;
				tick = global.currentFrame;
			}
			with _connector{
				upgradeLeft = _upgradeLeft;
				upgradeRight = _upgradeRight;
				left = upgradeLeft.x + 11;
				right = upgradeRight.x + 11;
			}
			--rewardQueue;
		}
	}
}

var _holdingLeftPrime = pressing_left();
var _holdingRightPrime = pressing_right();
if not _holdingLeftPrime{
	global.lockoutLeft = false;
}
if not _holdingRightPrime{
	global.lockoutRight = false;
}
global.releasedLeft = global.holdingLeft and not _holdingLeftPrime;
global.releasedRight = global.holdingRight and not _holdingRightPrime;
global.pressedLeft = not global.holdingLeft and _holdingLeftPrime;
global.pressedRight = not global.holdingRight and _holdingRightPrime;
global.holdingLeft = _holdingLeftPrime;
global.holdingRight = _holdingRightPrime;
if global.lockoutLeft{
	global.releasedLeft = false;
	global.holdingLeft = false;
	global.pressedLeft = false;
}
if global.lockoutRight{
	global.releasedRight = false;
	global.holdingRight = false;
	global.pressedRight = false;
}

if global.upgrading{
	++global.upgradeFrame;
	
	if global.gemAddGem != global.GEM_EMPTY{
		if global.releasedLeft and not global.holdingRight{
			vec2_subtract(gemAddSlot, gemAddOrientation);
			if not is_inbounds(gemAddSlot){
				vec2_add(gemAddSlot, gemAddOrientation);
			}
		}
		if global.releasedRight and not global.holdingLeft{
			vec2_add(gemAddSlot, gemAddOrientation);
			if not is_inbounds(gemAddSlot){
				vec2_subtract(gemAddSlot, gemAddOrientation);
			}
		}
		if global.holdingLeft and global.holdingRight and global.gemGrid[gemAddSlot.x][gemAddSlot.y].gem == global.GEM_EMPTY{
			++global.gemAddTick;
			if global.gemAddTick == 10{
				global.gemGrid[gemAddSlot.x][gemAddSlot.y].gem = global.gemAddGem;
				global.gemAddTick = 0;
				global.gemAddGem = global.GEM_EMPTY;
				global.upgrading = false;
				for (var i = 0, n = array_length(gemSlotsEmpty); i < n; i++){
					if vec2_equals(gemSlotsEmpty[i], gemAddSlot){
						array_delete(gemSlotsEmpty, i, 1);
						break;
					}
				}
				
				gemAddSlot = array_length(gemSlotsEmpty) > 0 ? Vec2_copy(gemSlotsEmpty[irandom(array_length(gemSlotsEmpty) - 1)]) : undefined;
				gemAddOrientation = brandom() ? Vec2(1, 0) : Vec2(0, -1);
				
				var _currentPosition = global.gemsExplored[0];
				rejig_charge(Vec2(gem_unhash_i(_currentPosition), gem_unhash_j(_currentPosition)));
			}
		}else{
			global.gemAddTick = 0;
		}
	}
}
if not global.upgrading{
	++global.currentFrame;
	
	if array_length(spawnQueue) == 0{
		if instance_number(o_enemy) <= global.score >> 8{ //@TODO
			repeat(spawnDifficulty){
				array_push(spawnQueue, o_enemyBasic);
			}
			array_shuffle_ext(spawnQueue);
			spawnLocation = irandom_range(0, 95);
			spawnDifficulty += 2;
		}
	}
	if array_length(spawnQueue) > 0 and global.intro >= 400{
		if global.currentFrame & 0b1111111 == 16{
			for (var i = 0, n = min(8, array_length(spawnQueue)); i < n; i++){
				instance_create_depth(6 + ((spawnLocation + 12*i) % 96), -5, DEPTH.ENEMY, array_pop(spawnQueue));
			}
		}
	}
}