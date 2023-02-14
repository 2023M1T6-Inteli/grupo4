extends Node2D

func _on_menu_pressed():
	get_tree().change_scene("res://Cenas/Tela1.tscn")


func _on_restart_pressed():
	get_tree().change_scene("res://Cenas/World.tscn")
