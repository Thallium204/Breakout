extends KinematicBody2D

onready var Game = get_tree().get_root().get_node("Game")

var direVec 
var arc = 0.3 
var speed = 8
var ballDamage = 1
var overKill = 3.5


func _ready():
	direVec = Vector2(rand_range(-1, 1), rand_range(-0.3, -1)).normalized()

func correctAngle():
	var angle = abs(direVec.angle())
	if angle <= arc:
		if angle != 0:
			angle = arc * (direVec.y / abs(direVec.y))
		else:
			angle = arc 
		direVec = Vector2(cos(angle), sin(angle))
	elif angle >= PI - arc:
		angle = (PI - arc) * (direVec.y / abs(direVec.y))
		direVec = Vector2(cos(angle), sin(angle))

func _physics_process(delta):
	var collision_info = move_and_collide(direVec * speed * delta * 100)
	var bounce = true 
	if collision_info: # If we've collided with something
		#if we are colliding with the brick
		if "objBrick" in collision_info.collider.name:
			var remHealth = collision_info.collider.damage(ballDamage) #thats a lot of damage
			if remHealth <= -overKill:
				bounce = false
			speed += 0.05
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
		
		if bounce:
			direVec = direVec.bounce(collision_info.normal) # changing our exit trajectory
			correctAngle()






