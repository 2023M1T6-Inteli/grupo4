extends Node2D

#mudança de tela para prosseguir 
func _on_botoOk_pressed():
	get_tree().change_scene("res://Cenas/instrutores.tscn") #mudança para a tela de instrutores

#mudança de tela para voltar
func _on_botoVoltar_pressed():
	get_tree().change_scene("res://Cenas/menu.tscn") #mudança para a tela de menu
