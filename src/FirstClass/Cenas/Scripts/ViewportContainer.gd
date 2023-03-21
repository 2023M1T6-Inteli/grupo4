extends ViewportContainer

func _process(delta):
	if self.material == null:
		$AnimacaoBebida.stop()
		$AnimacaoSono.stop() #deixa a tela em condições normais após o efeito dos debuffs de bebida ou sono expirarem
	
	elif self.material == preload("res://Efeitos tela/ShaderSono.tres"):
		$AnimacaoSono.play("CenasSono") #aplica o efeito do debuff de sono
		
	elif self.material == preload("res://Efeitos tela/ShaderBebida.tres"):
		$AnimacaoBebida.play("Bebida")#aplica o efeito do debuff de bebida
		
