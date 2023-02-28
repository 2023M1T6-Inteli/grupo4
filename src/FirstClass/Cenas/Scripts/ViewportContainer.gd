extends ViewportContainer


func _on_AnimaoBebida_animation_finished(anim_name):
	if anim_name == "BebidaOut":
		self.material = null
# Função que retira o efeito da tela relacionado ao Debuff de Bebida

func _on_AnimaoSono_animation_finished(anim_name):
	if anim_name == "SonoOut":
		self.material = null
# Função que retira o efeito da tela relacionado ao Debuff de Sono
