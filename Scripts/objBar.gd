extends KinematicBody2D

func _input(event):
	if event is InputEventScreenDrag:
		move_and_collide(Vector2(event.relative.x, 0))

func updateUI():
	$labCoins.text = str(Globals.score)
