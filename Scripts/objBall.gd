extends KinematicBody2D

var moveVec 
var rng = RandomNumberGenerator.new()
var arc = 0.1 
var speed = 8
var speedMod = 1.5
var timer = 0
var speedCap = pow(speedMod, 3)

func _ready():
	rng.randomize()
	var angle = rng.randf_range(0 + arc, PI - arc)
	moveVec = Vector2(cos(angle), -sin(angle))

func _physics_process(delta):
	var collision_info = move_and_collide(moveVec * delta,false)
	if collision_info:
		moveVec = moveVec.bounce(collision_info.normal)
		print(collision_info.collider.name)
		if "Brick" in collision_info.collider.name:
			collision_info.collider.queue_free()
			
	timer += delta
	if timer > 5:
		timer = 0
		speed = speed * speedMod
	if speed > 5 * speedCap:
		speed = 5 * speedCap
	
	position += moveVec * speed * delta * 100