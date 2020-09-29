extends Control

#var previousColor = $btnFreeUpgs.get_color("font_color") DOES NOT WORK FOR SOME REASON, CANT FIND NODE

var txtDict = {true:"On", 			false:"Off"}
var colDict = {true:Color.green, 	false:Color.red}

func _ready():
	updateUI()

func updateUI():
	# Free Upgrades
	$btnFreeUpgs.text = txtDict[Globals.freeUpgrades]
	$btnFreeUpgs.set("custom_colors/font_color", colDict[Globals.freeUpgrades])
	$btnFreeUpgs.set("custom_colors/font_color_hover", colDict[Globals.freeUpgrades])
	# Noob Mode
	$btnNoobMode.text = txtDict[Globals.noobMode]
	$btnNoobMode.set("custom_colors/font_color", colDict[Globals.noobMode])
	$btnNoobMode.set("custom_colors/font_color_hover", colDict[Globals.noobMode])

func _on_btnFreeUpgs_pressed():
	
	Globals.toggle("freeUpgrades")
	updateUI()

func _on_btnNoobMode_pressed():
	Globals.toggle("noobMode")
	updateUI()



func _on_btnBack_pressed():
	get_tree().change_scene("res://Scenes/Menu.tscn")



