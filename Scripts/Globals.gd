extends Node

var score = 0
var highScore = 0
var totalScore = 0

func resetScore():
	score = 0
	
func updateScores():
	if score > highScore:
		highScore = score
	totalScore += score

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
	saveFile.open("user://saveFile.save", File.READ)
	var saveData = parse_json(saveFile.get_line())
	for key in saveData:
		set(key, saveData[key])
