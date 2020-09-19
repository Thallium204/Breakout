extends Control

func _ready():
	Globals.loadGame()
	get_node("contScores").updateUI()

func _on_btnPlay_pressed():
	get_tree().change_scene("res://Scenes/Game.tscn")




func _on_btnStore_pressed():
	get_tree().change_scene("res://Scenes/Store.tscn")
