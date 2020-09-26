extends GridContainer

func updateUI():
	$labScoreLast.text = str(floor(Globals.score))
	$labScoreHigh.text = str(floor(Globals.highScore))
	$labScoreTotal.text = str(floor(Globals.totalScore))



