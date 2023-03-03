extends ViewportContainer

func _process(delta):
	if self.material == null:
		$"AnimaçãoBebida".stop(true)
		$"AnimaçãoSono".stop(true)
	
	elif self.material == preload("res://Efeitos tela/ShaderSono.tres"):
		#$"AnimaçãoBebida".stop(false)
		$"AnimaçãoSono".play("CenasSono")
	elif self.material == preload("res://Efeitos tela/ShaderBebida.tres"):
		#$"AnimaçãoBebida"
		$"AnimaçãoBebida".play("Bebida")
	
