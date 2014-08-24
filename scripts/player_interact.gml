///player_interact();
if(!StoryController.cutscene && Player.hdist == 0 && Player.vdist == 0) {
    if(input_check_pressed(ACTION)) {
        var xx = 0, yy = 0;
        switch(facing) {
            case UP:
                yy = -TILESIZE;
                break;
            case DOWN:
                yy = TILESIZE;
                break;
            case LEFT:
                xx = -TILESIZE;
                break;
            case RIGHT:
                xx = TILESIZE;
                break;
        }
        if(place_meeting(x + xx, y + yy, _examine)) {
            with(instance_place(x + xx, y + yy, _examine)) {
                dialog_from_array(0, array_height_2d(message) - 1);
            }
        }
        if(place_meeting(x + xx, y + yy, _item)) {
            with(instance_place(x + xx, y + yy, _item)) {
                if(item != "") {
                    inv_add(item, 1);
                    with(Controller) {
                        var i = array_length_1d(itemsCollected);
                        itemsCollected[i] = other.id;
                    }
                    instance_destroy();
                }
            }
        }
        if(place_meeting(x + xx, y + yy, _char)) {
            with(instance_place(x + xx, y + yy, _char)) {
                switch(other.facing) {
                    case LEFT:
                        facing = RIGHT;
                        break;
                    case RIGHT:
                        facing = LEFT;
                        break;
                    case UP:
                        facing = DOWN;
                        break;
                    case DOWN:
                        facing = UP;
                        break;
                }
                dialog_from_array(0, array_height_2d(message) - 1);
            }
        }
        input_clear(ACTION);
    }
}
