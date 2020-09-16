extends KinematicBody2D

onready var colorSides = $colorSides

export(Vector2) var barSize 

func _ready():
	updateBarSize()

func _input(event):
	if event is InputEventScreenDrag:
		move_and_collide(Vector2(event.relative.x, 0))

func updateUI():
	$colorSides/labCoins.text = str(Globals.score)
	
func updateBarSize():
	colorSides.margin_left = - barSize.x / 2
	colorSides.margin_right = barSize.x / 2
	colorSides.margin_top = - barSize.y / 2
	colorSides.margin_bottom = barSize.y / 2
	$shapeBar.shape.radius = barSize.y / 2
	$shapeBar.shape.height = barSize.x - barSize.y
