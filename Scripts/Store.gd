extends Control

func _ready():
	updateUI()

func _on_btnBack_pressed():
	var _verify = get_tree().change_scene("res://Scenes/Menu.tscn")

func updateUI():
	$labScoreTotal.text = str(Globals.totalScore)
