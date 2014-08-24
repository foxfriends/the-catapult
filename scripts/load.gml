///load(file)
if(file_exists(working_directory + "/save" + string(argument[0]))) {
    ini_open(working_directory + "/game");
    Controller.playTime = ini_read_real(string(argument[0]), 't', 0);
    ini_close();
    var file = file_text_open_read(working_directory + "/save" + string(argument[0]));
    //Get information from file
    var data = file_text_read_string(file);
    data = decrypt(data);
    for(var i = 0; i < array_length_1d(StoryController.state); i++) {
        StoryController.state[i] = real(string_copy(data, 1, string_pos(" ", data) - 1));
        data = string_copy(data, string_pos(" ", data), string_length(data));
        StoryController.progress[i] = real(string_copy(data, 1, string_pos(" ", data) - 1));
        data = string_copy(data, string_pos(" ", data), string_length(data));
    }
    file_text_readln(file);
    ds_grid_read(InventoryController.inv, file_text_read_string(file));
    room_goto(rLeft_center);
}
