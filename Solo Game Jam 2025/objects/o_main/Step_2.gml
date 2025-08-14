if not global.upgrading{
	global.gunCharge++;
	global.gunCharge = min(global.gunCharge, 19);
	part_system_update(global.playerBulletParticleSystem);
}

for (var i = 0, n = array_length(global.gemsExplored); i < n; i++){
	global.gemGrid[gem_unhash_i(global.gemsExplored[i])][gem_unhash_j(global.gemsExplored[i])].charge = global.gunCharge;
}