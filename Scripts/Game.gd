extends Node2D

onready var Game = get_tree().get_root().get_node("Game")
onready var Bricks = Game.get_node("Bricks")

var windowSize 

export(int) var rows  
export(int) var columns 

export(Color) var startingColor 
export(Color) var endingColor  

var objBrick_load = preload("res://Scenes/objBrick.tscn")
var objBar_load = preload("res://Scenes/objBar.tscn")
var objBall_load = preload("res://Scenes/objBall.tscn")

func _ready():
	
	generateBricks()
	
	var objBar = objBar_load.instance()
	Game.add_child(objBar)
	
	var objBall = objBall_load.instance()
	objBall.position = objBar.position + Vector2(objBar.barSize[0]/2, -50)
	Game.add_child(objBall)

func generateBricks():
	for rowPos in range(rows):
		for colPos in range(columns):
			var objBrick = objBrick_load.instance()
			objBrick.position = Vector2(colPos * 240, rowPos * 140) + Vector2(20, 20)
			objBrick.get_node("colorOutline/colorBrick").color = startingColor + (endingColor - startingColor)/(rows - 1) * rowPos
			objBrick.name = "objBrick"+str(rowPos)+str(colPos)
			Bricks.add_child(objBrick)

func tryToGenerateBricks():
	if Bricks.get_children().size() == 0:
		generateBricks()










