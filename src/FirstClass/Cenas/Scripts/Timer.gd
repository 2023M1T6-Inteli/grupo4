extends Label

var seconds = 0
var minutes = 2

# As 2 variáveis acima são responsáveis por ditar em quantos minutos e segundos
# o jogador deve completar uma volta, para que ele não perca

var secondsDisplay = ""
var minutesDisplay = ""

# As 2 variáveis acima, representam os números que apareceram no timer, na tela
# do jogador


func _process(delta):
	
	if seconds == -1:
		seconds = 59
		minutes -= 1
	
	# Condição que transforma os minutos que se passam em segundos
		
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
	
	if minutes == -1:
		$Timer.stop()
		get_tree().change_scene("res://Cenas/tela_gameover.tscn")
		
	set_text(str(minutesDisplay)+":"+str(secondsDisplay))
	
	# Condição que leva para tela de Game Over caso o temporizador chegue a 0
	
func _on_Timer_timeout():
	seconds -= 1
	
# Função que conta os segundos que se passam na vida real e desconta do tempo
# proporcionado ao jogador
