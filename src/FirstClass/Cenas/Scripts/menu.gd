extends Node2D

#botão para jogar
func _on_BotoJogar_pressed():
	get_tree().change_scene("res://Cenas/nome.tscn") #mudança de cena
	
#botão para ir para as intruções do jogo
func _on_BotoInstrues_pressed():
	get_tree().change_scene("res://Cenas/Instruções.tscn") #mudança de cena
