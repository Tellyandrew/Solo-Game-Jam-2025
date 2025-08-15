if global.upgrading{
	exit;
}

bottom = max(192 - 14, floor(lerp(192, 192 - 14, (global.intro - 200)/200)));

rightThruster = global.holdingRight;
leftThruster = global.holdingLeft;

#macro TOP_THRESHOLD (192 - 46)
if rightThruster and leftThruster{
	if thrustForwardBuffer < 6{
		instance_create_depth(x, y, DEPTH.PARTICLE_IMPORTANT, o_playerGhost);
		x = thrustForwardXPos;
		thrustForwardBuffer = infinity;
	}
	if y == TOP_THRESHOLD{
		#macro TOP_VELOCITY 3
		yVelocity = TOP_VELOCITY;
		
		var _nextPosition;
		var _shotPositions = [];
		var _bounces = 0;
		var _pierces = 0;
		var _homing = 0;
		var _forksLeft = 0;
		var _forksRight = 0
		var _burnsLeft = 0;
		var _burnsRight = 0;
		for (var i = 0, n = array_length(global.gemsExplored); i < n; i++){
			var _gemSocket = global.gemGrid[gem_unhash_i(global.gemsExplored[i])][gem_unhash_j(global.gemsExplored[i])];
			switch(_gemSocket.gem){
				case global.GEM_GUN_LEFT:
					array_push(_shotPositions, Vec2(-3, 3));
					if i == 0{
						_nextPosition = Vec2(4, 4);
					}
					break;
				case global.GEM_GUN_MIDDLE:
					array_push(_shotPositions, Vec2(0, 0));
					if i == 0{
						_nextPosition = Vec2(8, 8);
					}
					break;
				case global.GEM_GUN_RIGHT:
					array_push(_shotPositions, Vec2(3, 3));
					if i == 0{
						_nextPosition = Vec2(0, 0);
					}
					break;
				case global.GEM_BOUNCE:
					++_bounces;
					break;
				case global.GEM_PIERCE:	
					++_pierces;
					break;
				case global.GEM_HOMING:
					_homing += 0.4;
					break;
				case global.GEM_FORK_LEFT:
					++_forksLeft;
					break;
				case global.GEM_FORK_RIGHT:
					++_forksRight;
					break;
				case global.GEM_BURN_LEFT:
					++_burnsLeft;
					break;
				case global.GEM_BURN_RIGHT:
					++_burnsRight;
					break;
			}
			_gemSocket.charge = 0;
		}
		
		for (var i = 0; i < array_length(_shotPositions); i++){
			var _position = _shotPositions[i];
			with instance_create_depth(x + 4.5 + _position.x, y + 5 + yVelocity + _position.y, DEPTH.PLAYER_PROJECTILE, o_playerBullet){
				xVelocity = 0;
				yVelocity = -5;
				image_angle = 90;
				bounces = _bounces;
				pierces = _pierces;
				homing = _homing;
				forksLeft = _forksLeft;
				forksRight = _forksRight;
				tick = global.currentFrame;
				canUpgrade = true;
			}
		}
		var _offset = 11;
		if _burnsLeft > 0{
			var _increment = 90/(_burnsLeft + 1);
			var _end = _increment*_burnsLeft;
			
			for (var _angle = _increment; _angle <= _end; _angle += _increment){
				with instance_create_depth(x + 4.5, y + _offset + yVelocity, DEPTH.PLAYER_PROJECTILE, o_playerBullet){
					xVelocity = lengthdir_x(5, 90 + _angle);
					yVelocity = lengthdir_y(5, 90 + _angle);
					image_angle = 90 + _angle;
					bounces = _bounces;
					pierces = _pierces;
					homing = _homing;
					forksLeft = _forksLeft;
					forksRight = _forksRight;
					tick = global.currentFrame;
				}
			}
		}
		if _burnsRight > 0{
			var _increment = 90/(_burnsRight + 1);
			var _end = _increment*_burnsRight;
			
			for (var _angle = _increment; _angle <= _end; _angle += _increment){
				with instance_create_depth(x + 4.5, y + _offset + yVelocity, DEPTH.PLAYER_PROJECTILE, o_playerBullet){
					xVelocity = lengthdir_x(5, 90 - _angle);
					yVelocity = lengthdir_y(5, 90 - _angle);
					image_angle = 90 - _angle;
					bounces = _bounces;
					pierces = _pierces;
					homing = _homing;
					forksLeft = _forksLeft;
					forksRight = _forksRight;
					tick = global.currentFrame;
				}
			}
		}
		
		rejig_charge(_nextPosition);
	}
	y -= 1;
}else{
	y += 1;
}
y += yVelocity;
yVelocity = max(yVelocity - 0.1, 0);
y = clamp(y, TOP_THRESHOLD, bottom);

if y == bottom{
	yVelocity = 0;
}

if not rightThruster and not leftThruster{
	thrustForwardBuffer = 0;
	thrustForwardXPos = x;
}

x += rightThruster - leftThruster;
x = clamp(x, 1, 107 - sprite_width);

++thrustForwardBuffer;

--iFrames;

if global.intro < 200{
	y = 192;
}