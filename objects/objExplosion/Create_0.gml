image_speed = 1 / 3;
image_index = 0;

delay(((1 / image_speed) * image_number) - 1, function() { instance_destroy(); });

image_speed *= global.dt;