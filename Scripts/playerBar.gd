extends ColorRect



func _input(event):
	
	if event is InputEventScreenDrag:
		rect_position += event.relative
		rect_position[0] = clamp(rect_position[0], 0, 1920 - rect_size[0])
		rect_position[1] = clamp(rect_position[1], 930, 930)





