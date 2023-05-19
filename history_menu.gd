extends CanvasLayer

const Json = preload("res://map_gen_json.gd")
var my_json: Json

var death
var jumps
var gold 
var exp 
var wins 

func _ready() -> void:
	my_json = Json.new()
	my_json.load_file2()
	wins = my_json.data2.wins
	exp = my_json.data2.exp
	gold = my_json.data2.gold
	jumps = my_json.data2.jumps
	death = my_json.data2.loss
	$VBoxContainer/Label.text = "Deaths⚫⚫⚫ : " + str(death)
	$VBoxContainer/Label2.text = "Jumps⚫⚫⚫ : " + str(jumps)
	$VBoxContainer/Label3.text = "Gold⚫⚫⚫: " + str(gold)
	$VBoxContainer/Label4.text = "Exp⚫⚫⚫ : " + str(exp)
	$VBoxContainer/Label5.text = "Wins⚫⚫⚫ : " + str(wins)
	
	
	if death >= 10:
		$VBoxContainer/Label.text = "Deaths⚪⚫⚫ : " + str(death)
		if death >= 20:
			$VBoxContainer/Label.text = "Deaths⚪⚪⚫ : " + str(death)
			if death >= 30:
				$VBoxContainer/Label.text = "Deaths⚪⚪⚪: " + str(death)
	if jumps >= 10:
		$VBoxContainer/Label2.text = "Jumps⚪⚫⚫ : " + str(jumps)
		if jumps >= 20:
			$VBoxContainer/Label2.text = "Jumps⚪⚪⚫ : " + str(jumps)
			if jumps >= 30:
				$VBoxContainer/Label2.text = "Jumps⚪⚪⚪ : " + str(jumps)
	if gold >= 10:
		$VBoxContainer/Label3.text = "Gold⚪⚫⚫ : " + str(gold)
		if gold >= 20:
			$VBoxContainer/Label3.text = "Gold⚪⚪⚫ : " + str(gold)
			if gold>= 30:
				$VBoxContainer/Label3.text = "Gold⚪⚪⚪ : " + str(gold)
	if exp >= 500:
		$VBoxContainer/Label4.text = "Exp⚪⚫⚫ : " + str(exp)
		if exp >= 1000:
			$VBoxContainer/Label4.text = "Exp⚪⚪⚫ : " + str(exp)
			if exp >= 1500:
				$VBoxContainer/Label4.text = "Exp⚪⚪⚪: " + str(exp)
	if wins >= 10:
		$VBoxContainer/Label5.text = "Wins⚪⚫⚫ : " + str(wins)
		if wins >= 20:
			$VBoxContainer/Label5.text = "Wins⚪⚪⚫ : " + str(wins)
			if wins >= 30:
				$VBoxContainer/Label5.text = "Wins⚪⚪⚪: " + str(wins)
	
