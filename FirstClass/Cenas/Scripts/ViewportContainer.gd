extends ViewportContainer

func _process(delta):
	if self.material == null: #normalizando a tela após o efeito dos debuffs sono ou bebida expirar
		$AnimacaoBebida.stop()
		$AnimacaoSono.stop()
	
	elif self.material == preload("res://EfeitosTela/ShaderSono.tres"):
		$AnimacaoSono.play("CenasSono") #aplicando o efeito visual do debuff sono
		
	elif self.material == preload("res://EfeitosTela/ShaderBebida.tres"):
		$AnimacaoBebida.play("Bebida") #aplicando o efeito visual do debuff bebida
		
