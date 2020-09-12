extends Node2D

onready var Bricks = get_node("Bricks")

var windowSize 
var level = 1
var colorArray = []

export(int) var rows  
export(int) var columns 

var objBrick_load = preload("res://Scenes/objBrick.tscn")
var objBar_load = preload("res://Scenes/objBar.tscn")
var objBall_load = preload("res://Scenes/objBall.tscn")

func _ready():
	
	generateColorArray()
	
	for rowPos in range(rows):
		generateRow() 
	

func generateRow():
	# distance above the node at which the next row of blocks is created
	var brickHeight = level * -140
	# instances objBrick, sets its paramters, changes its value and adds it as a child of the Bricks node
	for colPos in range(columns):
		var objBrick = objBrick_load.instance()
		objBrick.position = Vector2(colPos * 240, brickHeight) + Vector2(20, 20)
		objBrick.get_node("colorOutline/colorBrick").color = colorArray[(level - 1) % colorArray.size()]
		objBrick.name = "objBrick"+str(level)+str(colPos)
		objBrick.value = level 
		objBrick.add_to_group("Level" + str(level))
		Bricks.add_child(objBrick)
		
	# instance a new tween, use it to smoothly move the bricks down a row 
	var twnBricks = Tween.new()
	add_child(twnBricks)
	twnBricks.interpolate_property(
		Bricks, "position", 
		Vector2(0, (level-1) * 140), Vector2(0, level * 140), 
		0.2, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
	)
	twnBricks.start()
	# increments the level by one 
	level += 1 

func tryToGenerateRow():
	if get_tree().get_nodes_in_group("Level" + str(level - rows)).size() == 0:
		generateRow()

func _on_sndTheme_finished():
	get_node("sndTheme").play()

func generateColorArray(clrNum = 4):
	var incr = 1.0/float(clrNum)
	for i in range(clrNum):
		colorArray.append(Color(1 - i * incr, 0 + i * incr, 0)) #adds color gradient (red)
	for i in range(clrNum):
		colorArray.append(Color(0, 1 - i * incr, 0 + i * incr)) #adds color gradient (green)
	for i in range(clrNum):
		colorArray.append(Color(0 + i * incr, 0, 1 - i * incr)) #adds color gradient (blue)









