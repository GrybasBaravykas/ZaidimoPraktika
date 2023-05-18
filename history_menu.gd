extends CanvasLayer

var death = 10
var jumps = 20
var gold = 30
var exp = 1
var wins = 10
func _ready() -> void:
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
	if exp >= 10:
		$VBoxContainer/Label4.text = "Exp⚪⚫⚫ : " + str(exp)
		if exp >= 20:
			$VBoxContainer/Label4.text = "Exp⚪⚪⚫ : " + str(exp)
			if exp >= 30:
				$VBoxContainer/Label4.text = "Exp⚪⚪⚪: " + str(exp)
	if wins >= 10:
		$VBoxContainer/Label5.text = "Wins⚪⚫⚫ : " + str(wins)
		if wins >= 20:
			$VBoxContainer/Label5.text = "Wins⚪⚪⚫ : " + str(wins)
			if wins >= 30:
				$VBoxContainer/Label5.text = "Wins⚪⚪⚪: " + str(wins)
	
