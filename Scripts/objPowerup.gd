extends KinematicBody2D

var speed = 400
var pwrName = "MULTI" 

func _physics_process(delta):
	var collisionInfo = move_and_collide(Vector2(0, speed) * delta)
	if collisionInfo:
		collisionInfo.collider.activatePowerup(pwrName)
		queue_free()
	elif position.y > 1920:
		queue_free()

