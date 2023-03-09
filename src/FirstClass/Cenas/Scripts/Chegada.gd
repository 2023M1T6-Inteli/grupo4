extends Area2D

func _on_Chegada_body_entered(body):
	if body.name == "Player" or body.name == "Cacamba":
		if Global.permissao == true:
			$DinheiroSFX.play()
			Global.points += 12000
			Global.gasolina = 90
			Global.notificacao = true
			Global.permissao = false
			
	 # Função responsável por reconhecer uma voltada dada pelo player e atribuir um bônus a essa volta,
	 # além de resetar o valor da gasolina para o valor original.

func _on_SegundoPonto_body_entered(body):
	if body.name == "Player" or body.name == "Cacamba":
		if Global.permissao == true:
			Global.gasolina = 90
			Global.permissao = false
	
	# Função responsável por resetar o valor da gasolina para o valor original na metade da pista.


func _on_Metade2_area_entered(area):
	Global.permissao = true


func _on_Metade1_area_entered(area):
	Global.permissao = true
 
# Funções que não permitem o player burlar as funções anteriormente comentadas e assim não ganhar
# bonûs infinito e gasolina infinita, pois eles precisam passar em partes da pista antes de conseguirem
# reabastecer e ganhar os bônus.
