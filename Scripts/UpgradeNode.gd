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
	$btnUpgrade.text = str(Globals.getUpgradeCost(objName, upgName))
	$btnUpgrade.disabled = Globals.isMaxedOut(objName, upgName)

func _on_btnUpgrade_pressed():
	Globals.upgrade(objName, upgName)
	updateUI()
