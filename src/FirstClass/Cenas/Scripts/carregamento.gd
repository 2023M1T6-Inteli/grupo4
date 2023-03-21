extends Node2D

func _ready():

	$AnimationPlayer.play("Fade In") #animação de entrada da tela
	MusicController.play_menu_music()
	await get_tree().create_timer(4).timeout #tempo que a animação de entrada será executada
	$AnimationPlayer.play("Fade out") #animação de saída
	await get_tree().create_timer(2.5).timeout #tempo que a animação de saída será executada
	get_tree().change_scene_to_file("res://Cenas/menu.tscn") #mudança de tela
