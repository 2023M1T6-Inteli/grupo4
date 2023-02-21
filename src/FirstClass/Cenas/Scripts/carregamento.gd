extends Node2D

func _ready():
	$AnimationPlayer.play("Fade In") #animação de entrada da tela
	yield(get_tree().create_timer(6), "timeout") #tempo que a animação de entrada será executada
	$AnimationPlayer.play("Fade out") #animação de saída
	yield(get_tree().create_timer(3), "timeout") #tempo que a animação de saída será executada
	get_tree().change_scene("res://Cenas/menu.tscn") #mudança de tela
