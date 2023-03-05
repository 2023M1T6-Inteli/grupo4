extends ViewportContainer

func _process(delta):
	if self.material == null:
		$"AnimaçãoBebida".stop()
		$"AnimaçãoSono".stop()
	
	elif self.material == preload("res://Efeitos tela/ShaderSono.tres"):
		$"AnimaçãoSono".play("CenasSono")
		
	elif self.material == preload("res://Efeitos tela/ShaderBebida.tres"):
		$"AnimaçãoBebida".play("Bebida")
		
