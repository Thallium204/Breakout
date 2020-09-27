extends Popup


func _on_popupPaused_gui_input(event):
	if not visible:
		return
	if event is InputEventScreenTouch:
		if event.pressed == true:
			get_tree().paused = false
			hide()
			get_parent().currentPopup = null

func _on_popupPaused_about_to_show():
	get_parent().currentPopup = self

func _on_texPauseButton_pressed():
	if get_parent().currentPopup != null:
		return
	get_tree().paused = true
	popup_centered()

func _on_btnMenu_pressed():
	get_tree().paused = false
	Globals.updateScores()
	get_tree().change_scene("res://Scenes/Menu.tscn")
