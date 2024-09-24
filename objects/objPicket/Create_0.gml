contactDamage = 2;
image_speed = 1 / 6 * global.dt;

yspeed = -6;
xspeed = instance_exists(objMegaman) ? arcCalcXspeed(yspeed, 0.25, x, y, objMegaman.x, objMegaman.y) : 0;
