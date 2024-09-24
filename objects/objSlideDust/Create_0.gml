image_speed = 0.2;
image_index = 0;

delay(((1 / image_speed) * image_number) - 1, function() { instance_destroy(); });

image_speed *= global.dt;