extends Node2D

#mudança de cena para ir para o menu
func _on_menu_pressed():
	get_tree().change_scene("res://Cenas/Menu.tscn")

#mudança de cena para iniciar o jogo novamente
func _on_restart_pressed():
	get_tree().change_scene("res://Cenas/Game.tscn")
