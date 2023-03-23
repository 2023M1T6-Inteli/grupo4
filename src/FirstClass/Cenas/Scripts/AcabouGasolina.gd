extends Node2D

func _ready():
	self.hide() #escondendo a mensagem ao iniciar o jogo


func _on_AcabouAnimacao_animation_finished(anim_name):
	get_tree().change_scene("res://Cenas/TelaGameOver.tscn")
