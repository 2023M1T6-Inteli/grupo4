extends RigidBody2D

func _ready():
	set_max_contacts_reported(3) #número máximo de corpos colidindo ao mesmo tempo
	set_contact_monitor(true) #monitorando as colisões
	if Global.cargaDoCaminhao == 1:
		$AnimatedSprite.animation = "Cloro"
	
	elif Global.cargaDoCaminhao == 2:
		$AnimatedSprite.animation = "Soda"
	
	elif Global.cargaDoCaminhao == 3:
		$AnimatedSprite.animation = "PVC"

# Função que efetua atroca do sprite das cargas, possibilitando diferentes cargas para o jogo


#função que controla efeitos sonoros, visuais e de jogabilidade que ocorrem quando o player colide com o cenário
func _on_Cacamba_do_Caminhao_body_entered(body):
	if body.name =="Player" or body.name =="Debufs":
		pass
	else:
		get_parent().get_node("Player").modulate = "413a3a"
		get_parent().get_node("Player").set_physics_process(false)
		get_parent().get_node("Player").get_node("SomRe").stop()
		get_parent().get_node("Player").get_node("SomIdle").stop()
		$Explosao.emitting = true
		$AnimatedSprite.modulate = "413a3a"
		$ExplosaoSFX.play()
		MusicController.stop_music()
		MusicController.debuffs1_sound_off()
		MusicController.debuffs2_sound_off()


#mudando de cena para o game over quando a explosão acaba
func _on_ExplosaoSFX_finished():
	get_tree().change_scene("res://Cenas/TelaGameOver.tscn")
	find_parent("Game").queue_free()
