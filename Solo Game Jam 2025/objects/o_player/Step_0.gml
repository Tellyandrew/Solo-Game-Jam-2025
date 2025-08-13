if global.upgrading{
	exit;
}

rightThruster = global.holdingRight;
leftThruster = global.holdingLeft;

var _top = 192 - 46;
var _bottom = 192 - 14;
if rightThruster and leftThruster{
	if thrustForwardBuffer < 6{
		instance_create_depth(x, y, 1000, o_playerGhost);
		x = thrustForwardXPos;
		thrustForwardBuffer = infinity;
	}
	if y == _top{
		yVelocity = 3;
		
		var _nextHash;
		
		var _hash = global.gemsExplored.hash;
		var _gemSocket = global.gemGrid[gem_unhash_i(_hash)][gem_unhash_j(_hash)];
		switch(_gemSocket.gem){
			case global.GEM_GUN_LEFT:
				with instance_create_depth(x + 4.5 - 3, y + 5 + yVelocity + 3, 100, o_playerBullet){
					xVelocity = 0;
					yVelocity = -5;
					image_angle = 90;
				}
				_nextHash = gem_hash(4, 4);
				break;
			case global.GEM_GUN_MIDDLE:
				with instance_create_depth(x + 4.5, y + 5 + yVelocity, 100, o_playerBullet){
					xVelocity = 0;
					yVelocity = -5;
					image_angle = 90;
				}
				_nextHash = gem_hash(8, 8);
				break;
			case global.GEM_GUN_RIGHT:
				with instance_create_depth(x + 4.5 + 3, y + 5 + yVelocity + 3, 100, o_playerBullet){
					xVelocity = 0;
					yVelocity = -5;
					image_angle = 90;
				}
				_nextHash = gem_hash(0, 0);
				break;
		}
		_gemSocket.charge = 0;
		
		global.gemsExplored = new GemSearchNode(_nextHash);
		global.gunCharge = 0;
	}
	y -= 1;
}else{
	y += 1;
}
y += yVelocity;
yVelocity = max(yVelocity - 0.1, 0);
y = clamp(y, _top, _bottom);

if y == _bottom{
	yVelocity = 0;
}

if not rightThruster and not leftThruster{
	thrustForwardBuffer = 0;
	thrustForwardXPos = x;
}

x += rightThruster - leftThruster;
x = clamp(x, 1, 107 - sprite_width);

++thrustForwardBuffer;