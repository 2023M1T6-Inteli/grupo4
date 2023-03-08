extends Area2D

func _on_Chegada_body_entered(body):
	if body.name == "Player" or body.name == "Cacamba":
		if Global.permissao == true:
			$DinheiroSFX.play()
			Global.points += 12000
			Global.gasolina = 70
			Global.notificacao = true
			Global.permissao = false

func _on_SegundoPonto_body_entered(body):
	if body.name == "Player" or body.name == "Cacamba":
		if Global.permissao == true:
			Global.gasolina = 70
			Global.permissao = false


func _on_Metade2_area_entered(area):
	Global.permissao = true


func _on_Metade1_area_entered(area):
	Global.permissao = true

