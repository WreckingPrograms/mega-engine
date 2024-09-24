image_speed = 0.15;
image_index = 0;

delay(floor((1 / image_speed) * 3), function() { instance_destroy(); });

image_speed *= global.dt;