extends Node2D

var hover = 0
#guarda o valor que define se o efeito sonoro de hover deve tocar ou não

func som_hover():
	if hover == 0:
		$SomHover.play()
		

#botão para jogar
func _on_BotoJogar_pressed():
	hover = 1
	#alterando texturas dos botões para não serem interativas após um ser pressionado
	$"BotãoJogar".texture_normal = preload("res://Sprites/botão_verde2.png")
	$"BotãoInstruções".texture_hover = null
	if !$SomConfirmar.playing:
		$SomConfirmar.play()
		yield(get_tree().create_timer(0.25), "timeout")
		get_tree().change_scene("res://Cenas/nome.tscn")
		#mudança de cena e efeito sonoro
	
#botão para ir para as intruções do jogo
func _on_BotoInstrues_pressed():
	hover = 1
	#alterando texturas dos botões para não serem interativas após um ser pressionado
	$"BotãoInstruções".texture_normal = preload("res://Sprites/botão_verde2.png")
	$"BotãoJogar".texture_hover = null
	if !$SomConfirmar.playing:
		$SomConfirmar.play()
		yield(get_tree().create_timer(0.25), "timeout")
		get_tree().change_scene("res://Cenas/instruções.tscn")
		#mudança de cena e efeito sonoro


func _on_BotoJogar_mouse_entered():
	som_hover()


func _on_BotoInstrues_mouse_entered():
	som_hover()
