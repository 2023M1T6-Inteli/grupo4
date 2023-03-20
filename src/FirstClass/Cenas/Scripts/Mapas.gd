extends Node2D




func _on_BotaoMapa1_pressed():
	Global.mapa = 1
	get_tree().change_scene("res://Cenas/interacao1.tscn")


func _on_BotaoMapa2_pressed():
	Global.mapa = 2
	get_tree().change_scene("res://Cenas/interacao1.tscn")
	


func _on_BotaoVoltar_pressed():
	get_tree().change_scene("res://Cenas/caminhoes.tscn")
