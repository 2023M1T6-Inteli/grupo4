extends Area2D

#variáveis de verificação para detectar se o caminhão chegou nos pontos
var chegou = false
var chegou2 = false

func _on_Chegada_body_entered(body):
	if body.name == "Player" or body.name == "Cacamba":
		chegou = true
		if Global.permissao == true:
			$DinheiroSFX.play()
			Global.points += 12000
			if Global.dificuldade == "Facil":
				Global.gasolina = 115.0
		
			if Global.dificuldade == "Medio":
				Global.gasolina = 105.0
		
			if Global.dificuldade == "Dificil":
				Global.gasolina = 90.0


	 # Função responsável por reconhecer uma voltada dada pelo player e atribuir um bônus a essa volta,
	 # além de resetar o valor da gasolina para o valor original.

func _on_SegundoPonto_body_entered(body):
	if body.name == "Player" or body.name == "Cacamba":
		chegou2 = true
		if Global.permissao == false:
			if Global.dificuldade == "Facil":
				Global.gasolina = 115.0
		
			if Global.dificuldade == "Medio":
				Global.gasolina = 105.0
		
			if Global.dificuldade == "Dificil":
				Global.gasolina = 90.0

	
	# Função responsável por resetar o valor da gasolina para o valor original na metade da pista.


func _on_Chegada_body_exited(body):
	chegou = false


func _on_SegundoPonto_body_exited(body):
	chegou2 = false
