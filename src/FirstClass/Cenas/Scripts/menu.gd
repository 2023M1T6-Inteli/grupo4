extends Node2D

var hover = 0
#guarda o valor que define se o efeito sonoro de hover deve tocar ou não

func som_hover():
	if hover == 0:
		$SomHover.play()
		

#botão para jogar
func _on_BotaoJogar_pressed():
	hover = 1
	#alterando texturas dos botões para não serem interativas após um ser pressionado
	$BotaoJogar.texture_normal = $BotaoJogar.texture_hover
	$BotaoInstrucoes.texture_hover = null
	if !$SomConfirmar.playing:
		$SomConfirmar.play()
		yield(get_tree().create_timer(0.25), "timeout")
		get_tree().change_scene("res://Cenas/nome.tscn")
		#mudança de cena e efeito sonoro
	
#botão para ir para as intruções do jogo
func _on_BotaoInstrucoes_pressed():
	hover = 1
	#alterando texturas dos botões para não serem interativas após um ser pressionado
	$BotaoInstrucoes.texture_normal = $BotaoInstrucoes.texture_hover
	$BotaoJogar.texture_hover = null
	if !$SomConfirmar.playing:
		$SomConfirmar.play()
		yield(get_tree().create_timer(0.25), "timeout")
		get_tree().change_scene("res://Cenas/instrucoes.tscn")
		#mudança de cena e efeito sonoro

#funções de efeito sonoro
func _on_BotaoJogar_mouse_entered():
	som_hover()

func _on_BotaoInstrucoes_mouse_entered():
	som_hover()

func _on_BotaoVolume_pressed():
	get_tree().change_scene("res://Cenas/Volume.tscn")
