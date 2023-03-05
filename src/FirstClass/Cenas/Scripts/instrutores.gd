extends Node2D

var hover = 0
#guarda o valor que define se o efeito sonoro de hover deve tocar ou não

func som_hover():
	if hover == 0:
		$SomHover.play()

#mudança de cena e efeito sonoro
func confirmar():
	hover = 1
	if !$"SomConfirmação".playing:
		$"SomConfirmação".play()
		yield(get_tree().create_timer(0.65), "timeout")
		get_tree().change_scene("res://Cenas/Caminhões.tscn")

#selecionar o personagem Tonhão
func _on_botoTonho_pressed():
	#alterando texturas dos botões para não serem interativas após um ser pressionado
	$"botãoTonhão".texture_normal = preload("res://assets_mytruck/face/tonhão_rindo.png")
	$"botãoNina".texture_hover = null
	$"botãoGina".texture_hover = null
	$"botãoSeuJorge".texture_hover = null
	confirmar()

#selecionar o personagem Seu Jorge
func _on_botoSeuJorge_pressed():
	#alterando texturas dos botões para não serem interativas após um ser pressionado
	$"botãoSeuJorge".texture_normal = preload("res://assets_mytruck/face/seujorge_rindo.png")
	$"botãoNina".texture_hover = null
	$"botãoTonhão".texture_hover = null
	$"botãoGina".texture_hover = null
	confirmar()

#selecionar a personagem Gina
func _on_botoGina_pressed():
	#alterando texturas dos botões para não serem interativas após um ser pressionado
	$"botãoGina".texture_normal = preload("res://assets_mytruck/face/gina_rindo.png")
	$"botãoNina".texture_hover = null
	$"botãoTonhão".texture_hover = null
	$"botãoSeuJorge".texture_hover = null
	confirmar()

#selecionar a personagem Nina
func _on_botoNina_pressed():
	#alterando texturas dos botões para não serem interativas após um ser pressionado
	$"botãoNina".texture_normal = preload("res://assets_mytruck/face/nina_rindo.png")
	$"botãoGina".texture_hover = null
	$"botãoTonhão".texture_hover = null
	$"botãoSeuJorge".texture_hover = null
	confirmar()

#botão para voltar para a tela anterior e efeito sonoro
func _on_botoVoltar_pressed():
	#alterando texturas dos botões para não serem interativas após um ser pressionado
	$"botãoNina".texture_hover = null
	$"botãoGina".texture_hover = null
	$"botãoTonhão".texture_hover = null
	$"botãoSeuJorge".texture_hover = null
	hover = 1
	if !$SomVoltar.playing:
		$SomVoltar.play()
		yield(get_tree().create_timer(0.35), "timeout")
		get_tree().change_scene("res://Cenas/nome.tscn")


#funções de efeito sonoro
func _on_botoTonho_mouse_entered():
	som_hover()

func _on_botoSeuJorge_mouse_entered():
	som_hover()

func _on_botoGina_mouse_entered():
	som_hover()

func _on_botoNina_mouse_entered():
	som_hover()
