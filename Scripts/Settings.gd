extends Control


#var previousColor = $btnFreeUpgs.get_color("font_color") DOES NOT WORK FOR SOME REASON, CANT FIND NODE

# CHANGE TO UPDATEUI SYSTEM
func _ready():
	updateUI_freeUpgs()


func _on_btnFreeUpgs_pressed():
	if $btnFreeUpgs.text == "Off":
		Globals.freeUpgrades = true
		$btnFreeUpgs.text = "On"
		$btnFreeUpgs.add_color_override("font_color", Color.green)
		$btnFreeUpgs.add_color_override("font_color_hover", Color.green)
	else:
		Globals.freeUpgrades = false
		$btnFreeUpgs.text = "Off"
		$btnFreeUpgs.add_color_override("font_color", Color.red)
		$btnFreeUpgs.add_color_override("font_color_hover", Color.red)
# CHANGE TO UPDATEUI SYSTEM

func updateUI_freeUpgs():
	if Globals.freeUpgrades == false:
		$btnFreeUpgs.text = "Off"
	else:
		$btnFreeUpgs.text = "On"
		$btnFreeUpgs.add_color_override("font_color", Color.green)
		$btnFreeUpgs.add_color_override("font_color_hover", Color.green)


func _on_btnNoobMode_pressed():
	if $btnNoobMode.text == "Off":
		Globals.noobMode = true
		$btnNoobMode.text = "On"
		$btnNoobMode.add_color_override("font_color", Color.green)
		$btnNoobMode.add_color_override("font_color_hover", Color.green)
	else:
		Globals.freeUpgrades = false
		$btnNoobMode.text = "Off"
		$btnNoobMode.add_color_override("font_color", Color.red)
		$btnNoobMode.add_color_override("font_color_hover", Color.red)




func _on_btnBack_pressed():
	get_tree().change_scene("res://Scenes/Menu.tscn")



