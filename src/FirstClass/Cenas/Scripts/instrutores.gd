extends Node2D

#mudança de cena ao clicar no personagem Tonhão
func _on_botoTonho_pressed():
	get_tree().change_scene("res://Cenas/Caminhões.tscn")

#mudança de cena ao clicar no personagem Seu Jorge
func _on_botoSeuJorge_pressed():
	get_tree().change_scene("res://Cenas/Caminhões.tscn")

#mudança de cena ao clicar na personagem Gina
func _on_botoGina_pressed():
	get_tree().change_scene("res://Cenas/Caminhões.tscn")

#mudança de cena ao clicar na personagem Nina
func _on_botoNina_pressed():
	get_tree().change_scene("res://Cenas/Caminhões.tscn")

#botão para voltar para a tela anterior 
func _on_botoVoltar_pressed():
	get_tree().change_scene("res://Cenas/Menu.tscn")
