extends Control

var objName: String 
var upgName: String
var upgArray: Array


func configure(objName_pass, upgName_pass, upgArray_pass):
	objName = objName_pass
	upgName = upgName_pass
	upgArray = upgArray_pass
	updateUI()

func updateUI():
	#$texObject.texture = load("path to texture")
	$labStat.text = upgName.to_upper()
	$progLevel.value = 100 * Globals.getUpgradeLevel(objName, upgName) / upgArray.size() 
	#$btnUpgrade.text = cost of the upgrade


func _on_btnUpgrade_pressed():
	Globals.upgrade(objName, upgName)
	updateUI()
