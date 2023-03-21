extends Node2D

#função de animação da entrada da tela
func _ready():
	$AnimationPlayer.play("Fade In")
	await get_tree().create_timer(6).timeout
