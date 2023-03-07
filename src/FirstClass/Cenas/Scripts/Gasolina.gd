extends Node2D
	
func _process(delta):
	Global.gasolina -= 1 #Diminuindo o valor da variável "gasolina" em 1 a cada frame
	if Global.gasolina < 0:
		Global.gasolina = 0
	$ProgressBar.value = Global.gasolina #Definindo o valor da barra de progresso para o valor atual da variável "gasolina"
	
	#Condição que leva para tela de Game Over caso a gasolina chegue a 0
	if Global.gasolina==0:
		get_tree().change_scene("res://Cenas/tela_gameover.tscn")
