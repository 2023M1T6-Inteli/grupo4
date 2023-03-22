extends Node2D
	
func _ready():
	$TempoGasolina.start()
	
func _process(delta):
	$ProgressBar.value = Global.gasolina #Definindo o valor da barra de progresso para o valor atual da variável "gasolina"
	
	if Global.gasolina == 0:
		get_tree().change_scene("res://Cenas/TelaGameOver.tscn")
	#Condição que leva para tela de Game Over caso a gasolina chegue a 0



func _on_TempoGasolina_timeout():
	Global.gasolina -= 1
	# Função que desconta a cada segundo um pouco da gasolina
