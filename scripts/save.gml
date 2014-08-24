///save(file)
var file = file_text_open_write(working_directory + "/save" + string(argument[0]));
//Save file data
var savestr = "";
for(var i = 0; i < array_length_1d(StoryController.state); i++) {
    savestr += string(StoryController.state[i]) + " " + string(StoryController.progress[i]) + " ";
}
savestr += string(array_length_1d(Controller.itemsCollected)) + " ";
file_text_write_string(file, encrypt(savestr));
file_text_writeln(file);
file_text_write_string(file, ds_grid_write(InventoryController.inv));
file_text_close(file);

ini_open(working_directory + "/game");
//Update header data
ini_write_real(string(argument[0]), 't', Controller.playTime);
ini_write_real('game', 'sound', Controller.sound);
ini_write_real('game', 'music', Controller.music);
ini_write_real('game', 'speed', Controller.DIASPDmult);
ini_write_string('game', 'controls', Controller.controls);
ini_close();
