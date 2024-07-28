if enemyXScale == 1
    draw_sprite_ext(enemySpr, enemyImg, round(x + sprite_get_xoffset(enemySpr) - (sprite_get_width(enemySpr)/2)), round(y + sprite_get_yoffset(enemySpr) - (sprite_get_height(enemySpr)/2)), enemyXScale, enemyYScale, enemyAngle, c_white, 1);
else
    draw_sprite_ext(enemySpr, enemyImg, round(x - sprite_get_xoffset(enemySpr) + (sprite_get_width(enemySpr)/2)), round(y + sprite_get_yoffset(enemySpr) - (sprite_get_height(enemySpr)/2)), enemyXScale, enemyYScale, enemyAngle, c_white, 1);

drawSelf();

