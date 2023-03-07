extends Area2D

func _on_Chegada_body_entered(body):
	if body.name == "Player" or body.name == "Cacamba":
		if Global.permissao == true:
			$DinheiroSFX.play()
			Global.points += 12000
			Global.gasolina = 8000
			Global.permissao = false



func _on_Metade_area_entered(area):
	Global.permissao = true
