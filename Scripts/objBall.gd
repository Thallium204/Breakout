extends KinematicBody2D

onready var Game = get_tree().get_root().get_node("Game")

var direVec 
var arc = 0.1 
var speed = 8

func _ready():
	direVec = Vector2(0, 1)

func _physics_process(delta):
	var collision_info = move_and_collide(direVec * speed * delta * 100)
	if collision_info: # If we've collided with something
		direVec = direVec.bounce(collision_info.normal) # changing our exit trajectory
		
		#if we are colliding with the brick
		if "objBrick" in collision_info.collider.name:
			Globals.score += collision_info.collider.value
			get_tree().call_group("updateCoins", "updateUI")
			collision_info.collider.queue_free()
			speed += 0.1
			get_node("sndBounce").play()
		
		#if we are colliding with the bottom border of the game window
		elif "bodyLose" in collision_info.collider.name:
			get_node("../popupGameOver").popup_centered()
			get_tree().paused = true 
		
		#if we are colliding with the player bar 
		elif "objBar" in collision_info.collider.name:
			direVec = (direVec * speed * delta * 100 + collision_info.collider_velocity / 150).normalized()
			Game.tryToGenerateRow()
			get_node("sndLowBounce").play()
			
		






