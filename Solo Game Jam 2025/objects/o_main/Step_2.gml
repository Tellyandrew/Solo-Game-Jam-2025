if global.upgrading{
	
	
	exit;
}

global.gunCharge++;
global.gunCharge = min(global.gunCharge, 19);
part_system_update(global.playerBulletParticleSystem);

var _hash = global.gemsExplored.hash;
var i = gem_unhash_i(_hash);
var j = gem_unhash_j(_hash);

global.gemGrid[i][j].charge = global.gunCharge;