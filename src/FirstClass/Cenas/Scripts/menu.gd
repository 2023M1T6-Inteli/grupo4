extends Node2D

#botão para jogar
func _on_BotoJogar_pressed():
	#alterando texturas dos botões para não serem interativas após um ser pressionado
	$"BotãoJogar".texture_normal = preload("res://Sprites/botão_verde2.png")
	$"BotãoInstruções".texture_hover = null
	
	if !$SomConfirmar.playing:
		$SomConfirmar.play()
		yield(get_tree().create_timer(0.25), "timeout")
		get_tree().change_scene("res://Cenas/nome.tscn") #mudança de cena e efeito sonoro
	
#botão para ir para as intruções do jogo
func _on_BotoInstrues_pressed():
	#alterando texturas dos botões para não serem interativas após um ser pressionado
	$"BotãoInstruções".texture_normal = preload("res://Sprites/botão_verde2.png")
	$"BotãoJogar".texture_hover = null

	if !$SomConfirmar.playing:
		$SomConfirmar.play()
		yield(get_tree().create_timer(0.25), "timeout")
		get_tree().change_scene("res://Cenas/Instruções.tscn") #mudança de cena e efeito sonoro
