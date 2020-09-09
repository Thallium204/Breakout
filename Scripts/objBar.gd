extends StaticBody2D

var barSize = Vector2(400,100)

func _input(event):
	
	if event is InputEventScreenDrag:
		position += event.relative
		position[0] = clamp(position[0], 0, 1920 - barSize[0])
		position[1] = clamp(position[1], 930, 930)
