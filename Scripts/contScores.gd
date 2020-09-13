extends HBoxContainer

func updateUI():
	get_node("labScoreLast").text = str(Globals.score)
	get_node("labScoreHigh").text = str(Globals.highScore)
	get_node("labScoreTotal").text = str(Globals.totalScore)



