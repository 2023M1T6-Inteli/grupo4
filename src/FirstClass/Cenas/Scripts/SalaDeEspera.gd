extends Node2D

var stopping_animation = 0 #variável que ajuda a parar a animação que tocaria em loop no process

func _ready():
	$Path2D/PathFollow2D.offset = 0
	$BalaoSono.playing = false
	$BalaoSono.hide()
	$Caminhar.play()
	#configurações iniciais da cena para iniciar a animação

func _process(delta):
	$Path2D/PathFollow2D.offset += 1.5 #fazendo o personagem caminhar
	
	if $Path2D/PathFollow2D.offset < 329.08:
		$Path2D/PathFollow2D/Caminhoneiro/AnimatedSprite.play("WalkUp")
	
	elif $Path2D/PathFollow2D.offset > 329.08 and $Path2D/PathFollow2D.offset < 376:
		$Path2D/PathFollow2D/Caminhoneiro/AnimatedSprite.play("WalkLeft")
	#acima, animações de caminhar do personagem de acordo com o trajeto percorrido
	
	else:
		$Caminhar.stop()
		play_animation()
		#quando o personagem chega no banco

func play_animation():
	if stopping_animation == 0:
		$Path2D/PathFollow2D/Caminhoneiro/AnimatedSprite.play("Sit")
		stopping_animation += 1
		yield(get_tree().create_timer(4.0), "timeout")
		$BalaoSono.show()
		$Pensamento.play("Pensamento")
		#animação de quando o personagem senta no banco e cai no sono
	else:
		pass



func _on_Pensamento_animation_finished(anim_name):
	get_tree().change_scene("res://Cenas/carregamento.tscn") #mudando de cena ao fim da animação
