extends Control

func _ready():
	$contScores.updateUI()

func _on_btnPlay_pressed():
	var _verify = get_tree().change_scene("res://Scenes/Game.tscn")

func _on_btnStore_pressed():
	var _verify = get_tree().change_scene("res://Scenes/Store.tscn")

func _on_btnSettings_pressed():
	var _verify = get_tree().change_scene("res://Scenes/Settings.tscn")


func _on_btnReset_pressed():
	Globals.resetData()



