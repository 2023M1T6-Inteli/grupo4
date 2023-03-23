extends Node2D


func _on_Botaofacil_pressed():
	Global.dificuldade = "Facil"
	get_tree().change_scene("res://Cenas/Mapas.tscn")

func _on_Botaomedio_pressed():
	Global.dificuldade = "Medio"
	get_tree().change_scene("res://Cenas/Mapas.tscn")


func _on_Botaodificil_pressed():
	Global.dificuldade = "Dificil"
	get_tree().change_scene("res://Cenas/Mapas.tscn")

#Os botões além de salvar a dificuldade em uma variavel global, ele conecta o botão ao início do jogo
