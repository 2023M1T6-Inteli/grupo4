extends Label

var seconds = 0
var minutes = 0

var secondsDisplay = ""
var minutesDisplay = ""

# As 2 variáveis acima, representam os números que apareceram no timer, na tela
# do jogador


func _process(delta):
	
	if seconds == 59:
		seconds = 0
		minutes += 1
	
	# Condição que transforma os segundos que se passam em minutos
		
	if seconds < 10:
		secondsDisplay = "0" + str(seconds)
	else:
		secondsDisplay = str(seconds)
		
	if minutes < 10:
		minutesDisplay = "0" + str(minutes)
	else:
		minutesDisplay = str(minutes)
	
	# Condições que adionam o 0 aos números menóres que 10, para que no timer
	# localizado na tela do jogador, fique mais agradável. Por exemplo: 02:09 ao
	# invés de 2:9
	
		
	set_text(str(minutesDisplay)+":"+str(secondsDisplay))
	
	# Mostra o tempo decorrido
	
func _on_Timer_timeout():
	seconds += 1
	
# Função que conta os segundos que se passam na vida real
