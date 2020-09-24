extends Control

func _ready():
	$labScoreTotal.text = str(Globals.totalScore)

func _on_btnBack_pressed():
	var _verify = get_tree().change_scene("res://Scenes/Menu.tscn")

