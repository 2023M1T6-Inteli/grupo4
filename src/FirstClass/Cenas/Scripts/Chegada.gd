extends Area2D
var chegou = false
var chegou2 = false
func _on_Chegada_body_entered(body):
	if body.name == "Player" or body.name == "Cacamba":
		if Global.permissao == true:
			chegou = true
			$DinheiroSFX.play()
			Global.points += 12000
			if Global.dificuldade == "Facil":
				Global.gasolina = 115.0
		
			if Global.dificuldade == "Medio":
				Global.gasolina = 105.0
		
			if Global.dificuldade == "Dificil":
				Global.gasolina = 50.0
			Global.permissao = false

	 # Função responsável por reconhecer uma voltada dada pelo player e atribuir um bônus a essa volta,
	 # além de resetar o valor da gasolina para o valor original.

func _on_SegundoPonto_body_entered(body):
	if body.name == "Player" or body.name == "Cacamba":
		if Global.permissao == false:
			chegou2 = true
			if Global.dificuldade == "Facil":
				Global.gasolina = 115.0
		
			if Global.dificuldade == "Medio":
				Global.gasolina = 105.0
		
			if Global.dificuldade == "Dificil":
				Global.gasolina = 50.0
			Global.permissao = true

	
	# Função responsável por resetar o valor da gasolina para o valor original na metade da pista.


