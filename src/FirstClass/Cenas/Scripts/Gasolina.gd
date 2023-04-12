extends Node2D
	
func _ready():
	$TempoGasolina.start()
	
	#definindo a gasolina total de acordo com a dificuldade
	if Global.dificuldade == "Facil":
		$ProgressBar.max_value = 145.0
		Global.gasolina = 145.0
		
	if Global.dificuldade == "Medio":
		$ProgressBar.max_value = 105.0
		Global.gasolina = 105.0
		
	if Global.dificuldade == "Dificil":
		$ProgressBar.max_value = 90.0
		Global.gasolina = 90.0
	
func _process(delta):
	$ProgressBar.value = Global.gasolina #Definindo o valor da barra de progresso para o valor atual da variável "gasolina"


func _on_TempoGasolina_timeout():
	Global.gasolina -= 1
	# Função que desconta a cada segundo um pouco da gasolina
