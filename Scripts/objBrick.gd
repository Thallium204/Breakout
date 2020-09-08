extends ColorRect


func _ready():
	pass 




func _on_area_entered(area):
	if area.name == "areaBall":
		queue_free()
