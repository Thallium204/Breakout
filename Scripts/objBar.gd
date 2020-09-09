extends StaticBody2D

onready var barSize = get_node("colorSides").rect_size

func _input(event):
	
	if event is InputEventScreenDrag:
		position += event.relative
		position[0] = clamp(position[0], 0, 1920 - barSize[0])
		position[1] = clamp(position[1], 930, 930)
