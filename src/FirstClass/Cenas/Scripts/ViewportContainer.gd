extends ViewportContainer

func _process(delta):
	if self.material == preload("res://Efeitos tela/ShaderSono.tres"):
		$AnimationPlayer.play("CenasSono")
	
