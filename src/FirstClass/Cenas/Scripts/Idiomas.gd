extends Node2D





func _on_BotaoPt_pressed():
	Global.lingua = "pt"
	get_tree().change_scene("res://Cenas/menu.tscn")

func _on_BotaoEsp_pressed():
	Global.lingua = "esp"
	get_tree().change_scene("res://Cenas/menu.tscn")


func _on_BotaoEng_pressed():
	Global.lingua = "eng"
	get_tree().change_scene("res://Cenas/menu.tscn")
