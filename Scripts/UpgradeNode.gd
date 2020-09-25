extends Control

var objName: String 
var upgName: String


func configure(objName_pass, upgName_pass):
	objName = objName_pass
	upgName = upgName_pass

	updateUI()

func updateUI():
	#$texObject.texture = load("path to texture")
	$labStat.text = upgName.to_upper()
	$progLevel.value = 100 * Globals.getUpgradeIndex(objName, upgName) / Globals.getUpgradeMaxIndex(objName, upgName)
	var isMaxedOut = Globals.isMaxedOut(objName,upgName)
	if isMaxedOut:
		$btnUpgrade.text = "MAX"
	else:
		$btnUpgrade.text = str(Globals.getUpgradeCost(objName, upgName))
	$btnUpgrade.disabled = isMaxedOut

func _on_btnUpgrade_pressed():
	Globals.upgrade(objName, upgName)
	updateUI()
	get_tree().call_group("scoreUI","updateUI")
