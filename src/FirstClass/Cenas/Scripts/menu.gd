extends Node2D

#função de animação da entrada da tela
func _ready():
	$AnimationPlayer.play("Fade In")
	yield(get_tree().create_timer(6), "timeout")
