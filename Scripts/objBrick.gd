extends ColorRect


func _ready():
	pass 




func _on_areaBrick_area_entered(area):
	queue_free()
