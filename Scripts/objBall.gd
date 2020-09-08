extends Sprite

var moveVec 
var rng = RandomNumberGenerator.new()
var arc = 0.1 
var speed = 5
var speedMod = 1.5
var timer = 0
var speedCap = pow(speedMod, 3)


func _ready():
	rng.randomize()
	var angle = rng.randf_range(0 + arc, PI - arc)
	moveVec = Vector2(cos(angle), -sin(angle))

func _process(delta):
	position += moveVec * speed * delta * 100
	timer += delta
	if timer > 5:
		timer = 0
		speed = speed * speedMod
	if speed > 5 * speedCap:
		speed = 5 * speedCap
		

func _on_Area2D_area_entered(area):
	if area.name == "areaVertical" or area.name == "areaTop":
		moveVec[1] *= -1 
	elif area.name == "areaHorizontal":
		moveVec[0] *= -1
		
		
		
