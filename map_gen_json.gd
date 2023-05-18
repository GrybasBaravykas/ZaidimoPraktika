extends Node

var path = "user://data.json"
var default_data = {
	"difficulty" : 1,
	"map_seed" : 0
}
var pos_val
var data = default_data

func create_file():
	var file = FileAccess.open(path, FileAccess.WRITE)
	file.store_string(JSON.stringify(data))

func load_file():
	var file = FileAccess.open(path, FileAccess.READ)
	data = file.get_as_text()
	data = JSON.parse_string(data)
	pos_val = data.map_seed
	

func gen_map(diff):
	data.difficulty = diff
	data.map_seed = randi() % 9 + 1
	for i in 13 * diff:
		data.map_seed = data.map_seed * 10 + (randi() % 10)
		
	create_file()	
func take_gen_val():
	var single = int(pos_val) % 10
	pos_val = pos_val / 10
	return single
