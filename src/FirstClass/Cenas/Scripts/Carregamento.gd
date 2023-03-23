extends Node2D

func _ready():

	$AnimationPlayer.play("Fade In") #animação de entrada da tela
	MusicController.play_menu_music()
	yield(get_tree().create_timer(4), "timeout") #tempo que a animação de entrada será executada
	$AnimationPlayer.play("Fade out") #animação de saída
	yield(get_tree().create_timer(2.5), "timeout") #tempo que a animação de saída será executada
	get_tree().change_scene("res://Cenas/Menu.tscn") #mudança de tela
