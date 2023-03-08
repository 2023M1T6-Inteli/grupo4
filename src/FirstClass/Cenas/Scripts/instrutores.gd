extends Node2D

var hover = 0
#guarda o valor que define se o efeito sonoro de hover deve tocar ou não

func som_hover():
	if hover == 0:
		$SomHover.play()

#mudança de cena e efeito sonoro
func confirmar():
	hover = 1
	if !$SomConfirmacao.playing:
		$SomConfirmacao.play()
		yield(get_tree().create_timer(0.65), "timeout")
		get_tree().change_scene("res://Cenas/caminhoes.tscn")

#selecionar o personagem Tonhão
func _on_BotaoTonhao_pressed():
	Global.rostoInstrutor = 'tonhao'
	Global.nomeInstrutor = 'Tonhão'
	#alterando texturas dos botões para não serem interativas após um ser pressionado
	$BotaoTonhao.texture_normal = $BotaoTonhao.texture_hover
	$BotaoNina.texture_hover = null
	$BotaoGina.texture_hover = null
	$BotaoSeuJorge.texture_hover = null
	confirmar()

#selecionar o personagem Seu Jorge
func _on_BotaoSeuJorge_pressed():
	Global.rostoInstrutor = 'seujorge'
	Global.nomeInstrutor = 'Seu Jorge'
	#alterando texturas dos botões para não serem interativas após um ser pressionado
	$BotaoTonhao.texture_hover = null
	$BotaoNina.texture_hover = null
	$BotaoGina.texture_hover = null
	$BotaoSeuJorge.texture_normal = $BotaoSeuJorge.texture_hover
	confirmar()

#selecionar a personagem Gina
func _on_BotaoGina_pressed():
	Global.rostoInstrutor = 'gina'
	Global.nomeInstrutor = 'Gina'
	#alterando texturas dos botões para não serem interativas após um ser pressionado
	$BotaoTonhao.texture_hover = null
	$BotaoNina.texture_hover = null
	$BotaoGina.texture_normal = $BotaoGina.texture_hover
	$BotaoSeuJorge.texture_hover = null
	confirmar()

#selecionar a personagem Nina
func _on_BotaoNina_pressed():
	Global.rostoInstrutor = 'nina'
	Global.nomeInstrutor = 'Nina'
	#alterando texturas dos botões para não serem interativas após um ser pressionado
	$BotaoTonhao.texture_hover = null
	$BotaoNina.texture_normal = $BotaoNina.texture_hover
	$BotaoGina.texture_hover = null
	$BotaoSeuJorge.texture_hover = null
	confirmar()

#botão para voltar para a tela anterior e efeito sonoro
func _on_BotaoVoltar_pressed():
	#alterando texturas dos botões para não serem interativas após um ser pressionado
	$BotaoTonhao.texture_hover = null
	$BotaoNina.texture_hover = null
	$BotaoGina.texture_hover = null
	$BotaoSeuJorge.texture_hover = null
	hover = 1
	if !$SomVoltar.playing:
		$SomVoltar.play()
		yield(get_tree().create_timer(0.35), "timeout")
		get_tree().change_scene("res://Cenas/nome.tscn")


#funções de efeito sonoro
func _on_BotaoTonhao_mouse_entered():
	$BotaoTonhao.set_position(Vector2(38, 290))
	som_hover()

func _on_BotaoSeuJorge_mouse_entered():
	som_hover()

func _on_BotaoGina_mouse_entered():
	som_hover()

func _on_BotaoNina_mouse_entered():
	som_hover()

func _on_BotaoVoltar_mouse_entered():
	som_hover()


func _on_BotaoTonhao_mouse_exited():
	$BotaoTonhao.set_position(Vector2(38, 280))
