extends Node

var score = 0
var highScore = 0
var totalScore = 0

var objects = {
	"ball": {
		"damage": [1, 1.3, 1.7, 2.2, 2.8, 3.5, 4.3, 5.2, 6.2, 7.3], #BIGDAMAGE
		"moneyMod": [1, 1.1, 1.2, 1.3, 1.4, 1.5, 1.6, 1.7, 1.8, 2],
	},
	"bar": {
		"width": [1, 1.1, 1.2, 1.3, 1.4, 1.5, 1.6, 1.7, 1.8, 2]
	},
	"bricks": {
		"powupRarity": [0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.1, 0.11]
	}
}

var upgs = {
	"ball": {
		"damage": 0, 
		"moneyMod": 0
	},
	"bar": {
		"width": 0
	},
	"bricks": {
		"powupRarity": 0
	}
}


func getUpgradeLevel(objName, upgName):
	return upgs[objName][upgName]

func upgrade(objName, upgName):
	upgs[objName][upgName] += 1 

func resetScore():
	score = 0

func updateScores():
	if score > highScore:
		highScore = score
	totalScore += score

func addToScore(scr):
	score += scr
	get_tree().call_group("scoreUI","updateUI")






func createSaveData():
	var scoreData = {
		"score": score,
		"highScore": highScore,
		"totalScore": totalScore
	}
	return scoreData
	
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

