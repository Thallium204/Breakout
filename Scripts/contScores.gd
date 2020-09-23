extends GridContainer

func updateUI():
	$labScoreLast.text = str(Globals.score)
	$labScoreHigh.text = str(Globals.highScore)
	$labScoreTotal.text = str(Globals.totalScore)



