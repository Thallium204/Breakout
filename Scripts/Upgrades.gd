extends Tabs

onready var UpgradeNode_load = preload("res://Scenes/UpgradeNode.tscn")


func _ready():
	for objName in Globals.objects:
		var dictUpgrades = Globals.objects[objName]
		for upgName in dictUpgrades:
			var UpgradeNode = UpgradeNode_load.instance()
			UpgradeNode.configure(objName, upgName)
			$vboxUpgrades.add_child(UpgradeNode)


