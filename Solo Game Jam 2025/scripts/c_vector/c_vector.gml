function Vec2(_x, _y){
	return {x : _x, y : _y};
}

function Vec2_copy(_vector){
	return Vec2(_vector.x, _vector.y);
}

function Vec2_copy_offset(_vector, _xOffset, _yOffset){
	return Vec2(_vector.x + _xOffset, _vector.y + _yOffset);
}

function vec2_equals(_vectorA, _vectorB){
	return _vectorA.x == _vectorB.x and _vectorA.y == _vectorB.y;
}

function vec2_add(_lVector, _rVector){
	_lVector.x += _rVector.x;
	_lVector.y += _rVector.y;
}

function Vec2_add(_vectorA, _vectorB){
	return Vec2(_vectorA.x + _vectorB.x, _vectorA.y + _vectorB.y);
}

function vec2_subtract(_lVector, _rVector){
	_lVector.x -= _rVector.x;
	_lVector.y -= _rVector.y;
}

function vec2_clamp(_vector, _min, _max){
	_vector.x = clamp(_vector.x, _min, _max);
	_vector.y = clamp(_vector.y, _min, _max);
}