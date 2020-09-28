extends StaticBody2D

onready var objPowerup_load = preload("res://Scenes/objPowerup.tscn")

var value 
var health = 4.0
var defense
var secLength = 4.0 
var powerup = ""
var brickSize 

func damage(dmg):
	health -= dmg * defense
	if health <= 0:
		Globals.addToScore(value)
		if powerup != "":
			var objPowerup = objPowerup_load.instance()
			objPowerup.position = get_global_transform().get_origin() + brickSize/2
			get_parent().get_parent().add_child(objPowerup)
		queue_free()
	else:
		updateUI()
	return health

func updateUI():
	$colorOutline/colorBrick.texture = load("res://Assets/Images/brick_" + str(floor(4 - health)) + ".png")

func configure(brickSpacing, level, color):
	#color.a += Globals.brickBrightness  RETURN LATER
	brickSize = brickSpacing - Globals.brickGap
	$CollisionShape2D.shape.radius = brickSize.y / 2
	$CollisionShape2D.shape.height = brickSize.x - brickSize.y
	$colorOutline.rect_size = brickSize
	if powerup != "":
		$colorOutline.color = Color.yellow
	$colorOutline/colorBrick.modulate = color
	value = level
	defense = (health * 2) / (1 + level * (1 / secLength))
	add_to_group("Level" + str(level))


