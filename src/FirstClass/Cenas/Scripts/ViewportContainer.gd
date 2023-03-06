extends ViewportContainer

func _process(delta):
	if self.material == null:
		$AnimacaoBebida.stop()
		$AnimacaoSono.stop()
	
	elif self.material == preload("res://Efeitos tela/ShaderSono.tres"):
		$AnimacaoSono.play("CenasSono")
		
	elif self.material == preload("res://Efeitos tela/ShaderBebida.tres"):
		$AnimacaoBebida.play("Bebida")
		
