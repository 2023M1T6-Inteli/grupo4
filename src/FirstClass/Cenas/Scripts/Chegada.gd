extends Area2D

func _on_Chegada_body_entered(body):
	if body.name == "Player" or body.name == "Cacamba":
		if Global.permissao == true:
			Global.gasolina = 150
			Global.permissao = false
			Global.reset = true

func _on_Metade_area_entered(area):
	Global.permissao = true
