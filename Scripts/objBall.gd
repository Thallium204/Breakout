extends KinematicBody2D

var moveVec 
var rng = RandomNumberGenerator.new()
var arc = 0.1 
var speed = 8
var speedCap = 16

func _ready():
	rng.randomize()
	var angle = rng.randf_range(0 + arc, PI - arc)
	moveVec = Vector2(cos(angle), -sin(angle))

func _physics_process(delta):
	
	var collision_info = move_and_collide(moveVec * speed * delta * 100)
	if collision_info: # If we've collided with something
		moveVec = moveVec.bounce(collision_info.normal) # changing our exit trajectory
		if "objBrick" in collision_info.collider.name:
			collision_info.collider.queue_free()
	
	if speed < speedCap:
		speed += delta





