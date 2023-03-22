extends Node2D

var stopping_animation = 0 #variável que ajuda a "parar" o process e, assim, não tocar repetidamente a animação

func _ready():
	$Path2D/PathFollow2D.offset = 0
	$BalaoSono.playing = false
	$BalaoSono.hide()
	$Caminhar.play()
	#iniciando a animação de caminhar do personagem e escondendo elementos que aparecerão depois

func _process(delta):
	$Path2D/PathFollow2D.offset += 1.5
	
	if $Path2D/PathFollow2D.offset < 329.08:
		$Path2D/PathFollow2D/Caminhoneiro/AnimatedSprite.play("WalkUp")
	
	elif $Path2D/PathFollow2D.offset > 329.08 and $Path2D/PathFollow2D.offset < 376:
		$Path2D/PathFollow2D/Caminhoneiro/AnimatedSprite.play("WalkLeft")
	#fazendo o personagem andar e selecionando a animação de acordo com a distância que ele já percorreu

	else:
		$Caminhar.stop()
		play_animation()
		#faz o personagem sentar na cadeira e tocar o resto da animação

func play_animation():
	if stopping_animation == 0:
		$Path2D/PathFollow2D/Caminhoneiro/AnimatedSprite.play("Sit")
		stopping_animation += 1
		yield(get_tree().create_timer(4.0), "timeout")
		$BalaoSono.show()
		$Pensamento.play("Pensamento")
		#continua a animação quando o personagem para de caminhar
	else:
		pass


#muda de cena quando a animação termina
func _on_Pensamento_animation_finished(anim_name):
	get_tree().change_scene("res://Cenas/Carregamento.tscn")
