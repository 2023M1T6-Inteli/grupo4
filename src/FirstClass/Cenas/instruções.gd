extends Node2D



#botão para voltar para a cena anterior
func _on_botoVoltar_pressed():
	get_tree().change_scene("res://Cenas/menu.tscn")
