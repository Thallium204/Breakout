extends PopupDialog

func _on_popupGameOver_about_to_show():
	get_parent().currentPopup = self
	Globals.updateScores()
	get_node("contScores").updateUI()
	Globals.saveGame()

func _on_btnMenu_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://Scenes/Menu.tscn")

func _on_btnPlayAgain_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://Scenes/Game.tscn")



