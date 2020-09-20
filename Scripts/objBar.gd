extends KinematicBody2D

onready var colorSides = $colorSides

export(Vector2) var barSize 

var widthMod: float

func _ready():
	var barData = Globals.getObjectData("bar")
	widthMod = barData["widthMod"]
	updateBarSize()

func _input(event):
	if event is InputEventScreenDrag:
		move_and_collide(Vector2(event.relative.x, 0))

func updateUI():
	$colorSides/labCoins.text = str(Globals.score)
	
func updateBarSize():
	var barWidth = barSize.x * widthMod
	colorSides.margin_left = - barWidth / 2
	colorSides.margin_right = barWidth / 2
	colorSides.margin_top = - barSize.y / 2
	colorSides.margin_bottom = barSize.y / 2
	$shapeBar.shape.radius = barSize.y / 2
	$shapeBar.shape.height = barWidth - barSize.y
