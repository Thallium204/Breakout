extends Control

onready var Bricks = get_node("Bricks")

var windowSize 
var level = 1
var colorArray = []
var scrDiv = 0.5
var currentPopup = null

export(int) var rows
export(int) var columns

var objBrick_load = preload("res://Scenes/objBrick.tscn")
var objBar_load = preload("res://Scenes/objBar.tscn")
var objBall_load = preload("res://Scenes/objBall.tscn")

func _ready():
	
	Globals.resetScore()
	
	generateColorArray()
	
	for _rowPos in range(rows):
		generateRow(true)


func generateRow(initial = false):
	# distance above the node at which the next row of blocks is created
	var brickSpacing = Vector2(rect_size.x / columns, (rect_size.y * scrDiv) / rows)
	# instances objBrick, sets its paramters, changes its value and adds it as a child of the Bricks node
	for colPos in range(columns):
		var objBrick = objBrick_load.instance()
		var color = colorArray[(level - 1) % colorArray.size()]
		objBrick.configure(brickSpacing, level, color)
		objBrick.position = Vector2(colPos * brickSpacing.x, - level * brickSpacing.y) + Globals.brickGap / 2
		Bricks.add_child(objBrick)
	# instance a new tween, use it to smoothly move the bricks down a row 
	var twnBricks = Tween.new()
	twnBricks.name = "Tween" + str(level)
	add_child(twnBricks)
	var time
	if initial:
		time = Globals.gameDelay	# Time taken to move all initial brick rows
	else:
		time = 0.6					# Time taken to move one row in-game
	twnBricks.interpolate_property(
		Bricks, "position",
		null, Vector2(0, level * brickSpacing.y),
		time, Tween.TRANS_BOUNCE, Tween.EASE_OUT
	)
	twnBricks.start()
	twnBricks.connect("tween_all_completed",twnBricks,"queue_free")
	# increments the level by one 
	level += 1

func tryToGenerateRow():
	for i in range(rows):
		var bricks = get_tree().get_nodes_in_group("Level" + str(level - rows))
		#print(bricks)
		if bricks.empty():
			generateRow()

func _on_sndTheme_finished():
	get_node("sndTheme").play()

func generateColorArray(clrNum = 4):
	colorArray = []
	var incr = 1.0/float(clrNum)
	for i in range(clrNum):
		colorArray.append(Color(1 - i * incr, 0 + i * incr, 0)) #adds color gradient (red)
	for i in range(clrNum):
		colorArray.append(Color(0, 1 - i * incr, 0 + i * incr)) #adds color gradient (green)
	for i in range(clrNum):
		colorArray.append(Color(0 + i * incr, 0, 1 - i * incr)) #adds color gradient (blue)


















