extends Label

var seconds = 0
var minutes = 4

var seconds_Display = ""
var minutes_Display = ""


func _process(delta):

	if seconds == 0:
		seconds = 59
		minutes -= 1
		
	if seconds < 10:
		seconds_Display = "0" + str(seconds)
	else:
		seconds_Display = str(seconds)
		
	if minutes < 10:
		minutes_Display = "0" + str(minutes)
	else:
		minutes_Display = str(minutes)
		
	set_text(str(minutes_Display)+":"+str(seconds_Display))

func _on_Timer_timeout():
	seconds -= 1
