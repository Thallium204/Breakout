extends Control

var btnText 


# CHANGE TO UPDATEUI SYSTEM
func _ready():
	if Globals.freeUpgrades == false:
		$btnFreeUpgs.text = "Off"
	else:
		$btnFreeUpgs.text = "On"

func _on_btnFreeUpgs_pressed():
	if $btnFreeUpgs.text == "Off":
		Globals.freeUpgrades = true
		$btnFreeUpgs.text = "On"
	else:
		Globals.freeUpgrades = false
		$btnFreeUpgs.text = "Off"
# CHANGE TO UPDATEUI SYSTEM







func _on_btnBack_pressed():
	get_tree().change_scene("res://Scenes/Menu.tscn")
