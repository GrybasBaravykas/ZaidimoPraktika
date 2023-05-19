extends Node

var path = "user://map_save.json"
var path2 = "user://game_progress.json"

var default_data = {
	"difficulty" : 1,
	"map_seed" : 0
}
var default_data2 = {
	"gold" :0,
	"exp" : 1,
	"wins" : 0,
	"loss" : 0,
	"jumps" : 0,
	"skin1" : 0,
	"skin2": 0
}

var data2 = default_data2
var pos_val
var data = default_data

func create_file():
	var file = FileAccess.open(path, FileAccess.WRITE)
	file.store_string(JSON.stringify(data))
	
func create_file2():
	var file = FileAccess.open(path2, FileAccess.WRITE)
	file.store_string(JSON.stringify(data2))

func load_file():
	var file = FileAccess.open(path, FileAccess.READ)
	data = file.get_as_text()
	data = JSON.parse_string(data)
	pos_val = data.map_seed

func load_file2():
	if not (FileAccess.file_exists(path2)):
		create_file2()
	var file = FileAccess.open(path2, FileAccess.READ)
	data2 = file.get_as_text()
	data2 = JSON.parse_string(data2)
	
func reset_data():
	data2 = default_data2
	create_file2()
	
func gen_map(diff):
	data.difficulty = diff
	data.map_seed = randi() % 9 + 1
	for i in 7 * diff:
		data.map_seed = data.map_seed * 10 + (randi() % 10)
		
	create_file()	
func take_gen_val():
	var single = int(pos_val) % 10
	pos_val = pos_val / 10
	return single
