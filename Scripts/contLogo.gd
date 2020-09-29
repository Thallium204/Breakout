extends VBoxContainer

var space = 40

func _physics_process(delta):
	
	margin_bottom = - sin( 2*PI * $timerBounce.time_left/$timerBounce.wait_time ) * space
