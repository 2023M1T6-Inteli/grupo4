extends Node2D

func _on_menu_pressed():
	get_tree().change_scene("")


func _on_restart_pressed():
	get_tree().change_scene("res://Cenas/Game.tscn")
