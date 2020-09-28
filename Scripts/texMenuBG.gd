extends TextureRect

var speed: float = 500
var direVec: Vector2
var startingPos: Vector2

var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()
	var moveAngle = rng.randf_range(-PI,PI)
	direVec = Vector2( cos(moveAngle) , sin(moveAngle) )
	startingPos = rect_position

func _physics_process(delta):
	rect_position += direVec * speed * delta
	var dispVec = rect_position - startingPos
	
	if dispVec.x >= 300:
		rect_position.x -= 300
	elif dispVec.x <= -300:
		rect_position.x += 300
	if dispVec.y >= 300:
		rect_position.y -= 300
	elif dispVec.y <= -300:
		rect_position.y += 300
