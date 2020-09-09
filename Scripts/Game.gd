extends Node2D

onready var Window = get_node("Window")

var windowSize 

export(int) var rows  
export(int) var columns 

export(Color) var startingColor 
export(Color) var endingColor  

var objBrick_load = preload("res://Scenes/objBrick.tscn")
var objBar_load = preload("res://Scenes/objBar.tscn")
var objBall_load = preload("res://Scenes/objBall.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	windowSize = Window.rect_position
	for rowPos in range(rows):
		for colPos in range(columns):
			var objBrick = objBrick_load.instance()
			objBrick.position = Vector2(colPos * 240, rowPos * 140) + Vector2(20, 20)
			objBrick.get_node("colorBrick").color = startingColor + (endingColor - startingColor)/(rows - 1) * rowPos
			objBrick.name = "objBrick"+str(rowPos)+str(colPos)
			Window.add_child(objBrick)
			print(objBrick.name)
			
	var objBar = objBar_load.instance()
	Window.add_child(objBar)
	
	var objBall = objBall_load.instance()
	objBall.position = objBar.position + Vector2(objBar.barSize[0]/2, -50)
	Window.add_child(objBall)
	
	








# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
	
