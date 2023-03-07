extends Node2D
	
func _ready():
	$ProgressBar.value = Global.gasolina
	$Timer.wait_time = 150
	$Timer.start()
	
func _process(delta):
	Global.gasolina = $Timer.time_left
	$ProgressBar.value = Global.gasolina
	
	if Global.reset == true:
		$Timer.start()
		Global.reset = false
func _on_Timer_timeout():
	Global.gasolina = 0
