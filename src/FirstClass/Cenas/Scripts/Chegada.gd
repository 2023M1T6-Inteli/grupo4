extends Area2D

func _on_Chegada_body_entered(body):
	if body.name == "Player" or body.name == "Cacamba":
		if Global.permissao == true:
			Global.gasolina = 8000
			Global.permissao = false


func _on_Metade_area_entered(area):
	Global.permissao = true
