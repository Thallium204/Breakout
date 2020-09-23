extends StaticBody2D

var value 
var health = 4.0
var defense
var secLength = 4.0 

func damage(dmg):
	health -= dmg * defense
	if health <= 0:
		Globals.addToScore(value)
		queue_free()
	else:
		updateUI()
	return health

func updateUI():
	$colorOutline/colorBrick.texture = load("res://Assets/Images/brick_" + str(floor(4 - health)) + ".png")

func configure(brickSpacing, level, color):
	color.a += Globals.brickBrightness
	var brickSize = brickSpacing - Globals.brickGap
	$CollisionShape2D.shape.radius = brickSize.y / 2
	$CollisionShape2D.shape.height = brickSize.x - brickSize.y
	$colorOutline.rect_size = brickSize
	$colorOutline/colorBrick.modulate = color
	value = level
	defense = (health * 2) / (1 + level * (1 / secLength))
	add_to_group("Level" + str(level))


