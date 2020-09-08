extends Sprite

var moveVec 
var rng = RandomNumberGenerator.new()
var arc = 0.1 
var speed = 3

func _ready():
	rng.randomize()
	var angle = rng.randf_range(0 + arc, PI - arc)
	moveVec = Vector2(cos(angle), -sin(angle))

func _process(delta):
	position += moveVec * speed

func _on_Area2D_area_entered(area):
	if area.name == "areaVertical":
		moveVec[1] *= -1 
	elif area.name == "areaHorizontal":
		moveVec[0] *= -1
