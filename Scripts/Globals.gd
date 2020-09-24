extends Node

var score = 0
var highScore = 0
var totalScore = 0

var brickGap = Vector2(20,20)
var brickBrightness = 0.5
var gameDelay = 1.3

# DEV OPTIONS

var freeUpgrades = false

var skins = {
	"ball": {
		"plain": {
			"displayName": "Plain",
			"texture": "ball",
			"cost": 0
		},
		"skin1": {
			"displayName": "5upermegaultracoolskin",
			"texture": "nine_rect", #COME BACK HERE WITH SKIN
			"cost": 250
		}
	},
	"bar": {
		"plain": {
			"displayName": "Plain",
			"texture": "nine_rect", #COME BACK HERE WITH SKIN
			"cost": 250
		}
	},
	"bricks": {
		"plain": {
			"displayName": "Plain",
			"texture": "brick", #COME BACK HERE WITH SKIN
			"cost": 250
		}
	},
	"background":{
		"plain": {
			"displayName": "Plain",
			"texture": "space", #COME BACK HERE WITH SKIN
			"cost": 250
		}
	}
}

var objects = {
	"ball": {
		"damage": {
			"levels": [1, 1.3, 1.7, 2.2, 2.8, 3.5, 4.3, 5.2, 6.2, 7.3], 
			"baseCost": 100, 
			"modCost": 1.5
		}, #BIGDAMAGE
		
		"moneyMod": {
			"levels": [1, 1.1, 1.2, 1.3, 1.4, 1.5, 1.6, 1.7, 1.8, 2], 
			"baseCost": 100, 
			"modCost": 1.5
		},
		
	},
	"bar": {
		"widthMod": {
			"levels": [1, 1.1, 1.2, 1.3, 1.4, 1.5, 1.6, 1.7, 1.8, 2], 
			"baseCost": 100, 
			"modCost": 1.5
		},
		
	},
	"bricks": {
		"powupRarity": {
			"levels": [0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.1, 0.11], 
			"baseCost": 100, 
			"modCost": 1.5
		},
	}
}

var upgs = {}

var unlocks = {
	"plain": true,
	"skin1": false
}


func _ready():
	createUpgs()
	loadGame()

func createUpgs():
	upgs = {}
	for objName in objects:
		upgs[objName] = {}
		for upgName in objects[objName]:
			upgs[objName][upgName] = 0

func isMaxedOut(objName, upgName):
	return getUpgradeIndex(objName, upgName) == getUpgradeMaxIndex(objName, upgName)

func getObjectData(objName: String):
	var objData = {}
	for upgName in objects[objName]:
		objData[upgName] = getUpgradeValue(objName, upgName)
	return objData

func getUpgradeIndex(objName, upgName):
	return upgs[objName][upgName]

func getUpgradeMaxIndex(objName, upgName):
	return getUpgradeData(objName, upgName)["levels"].size() - 1

func upgrade(objName, upgName):
	if isMaxedOut(objName, upgName):
		print("Already maxed out")
		return
	var price = getUpgradeCost(objName, upgName)
	if totalScore < price and not freeUpgrades:
		print("Stop being poor")
		return
	upgs[objName][upgName] += 1
	totalScore -= price * int(not freeUpgrades)
	saveGame()

func getUpgradeValue(objName, upgName):
	return getUpgradeData(objName, upgName) ["levels"] [getUpgradeIndex(objName, upgName)]

func getUpgradeCost(objName, upgName):
	var upgData = getUpgradeData(objName, upgName)
	var price = upgData["baseCost"] * pow(upgData["modCost"], getUpgradeIndex(objName, upgName))
	return ceil(price)

func getUpgradeData(objName, upgName):
	return objects[objName][upgName]

func resetScore():
	score = 0

func updateScores():
	if score > highScore:
		highScore = score
	totalScore += floor(score)
	saveGame()

func addToScore(scr):
	score += scr * getUpgradeValue("ball", "moneyMod")
	get_tree().call_group("scoreUI","updateUI")
	saveGame()





func createSaveData():
	var saveData = {
		"score": score,
		"highScore": highScore,
		"totalScore": totalScore,
		"upgs": upgs
	}
	return saveData
	
func saveGame():
	var saveData = createSaveData()
	var saveFile = File.new()
	saveFile.open("user://saveFile.save", File.WRITE)
	saveFile.store_line(to_json(saveData))
	saveFile.close() 
	
func loadGame():
	var saveFile = File.new()
	if not saveFile.file_exists("user://saveFile.save"):
		return
	saveFile.open("user://saveFile.save", File.READ)
	var saveData = parse_json(saveFile.get_line())
	for key in saveData:
		set(key, saveData[key])
	saveFile.close()
		
func resetData():
	score = 0
	highScore = 0
	totalScore = 0
	createUpgs()
	saveGame()
	get_tree().call_group("scoreUI", "updateUI")








