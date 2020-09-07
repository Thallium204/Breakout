extends Node2D

onready var Window = get_node("Window")
var windowSize 
var rows = 4
var columns = 8

var objBrick_load = preload("res://Scenes/objBrick.tscn")

var playerBar_load = preload("res://Scenes/playerBar.tscn")



# Called when the node enters the scene tree for the first time.
func _ready():
	windowSize = Window.rect_position
	for rowPos in range(rows):
		for colPos in range(columns):
			var objBrick = objBrick_load.instance()
			objBrick.rect_position = Vector2(colPos * 240, rowPos * 140) + Vector2(20, 20)
			Window.add_child(objBrick)
			
	var playerBar = playerBar_load.instance()
	Window.add_child(playerBar)








# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
	
