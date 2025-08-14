var _holdingLeftPrime = pressing_left();
var _holdingRightPrime = pressing_right();
global.releasedLeft = global.holdingLeft and not _holdingLeftPrime;
global.releasedRight = global.holdingRight and not _holdingRightPrime;
global.pressedLeft = not global.holdingLeft and _holdingLeftPrime;
global.pressedRight = not global.holdingRight and _holdingRightPrime;
global.holdingLeft = _holdingLeftPrime;
global.holdingRight = _holdingRightPrime;

if keyboard_check(vk_tab) and not global.upgrading{
	if array_length(gemSlotsEmpty) > 0{
		global.upgrading = true;
		global.gunCharge = 0;
	
		gemAddGem = global.GEM_POOL[irandom(array_length(global.GEM_POOL) - 1)];
		gemAddTick = 0;
	}
}

if global.upgrading{
	++global.upgradeFrame;
	
	if gemAddGem != global.GEM_EMPTY{
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
			++gemAddTick;
			if gemAddTick == 10{
				global.gemGrid[gemAddSlot.x][gemAddSlot.y].gem = gemAddGem;
				gemAddTick = 0;
				gemAddGem = global.GEM_EMPTY;
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
			gemAddTick = 0;
		}
	}
}
if not global.upgrading{
	++global.currentFrame;

	if global.currentFrame & 0xFF == 0{
		instance_create_depth(irandom_range(5, 103), 5, -1000, o_targetDummy);
	}
}