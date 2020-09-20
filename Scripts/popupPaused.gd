extends Popup


func _input(event):
	
	if event is InputEventScreenTouch:
		
		if event.pressed == true:
			
			get_tree().paused = false
			hide()
