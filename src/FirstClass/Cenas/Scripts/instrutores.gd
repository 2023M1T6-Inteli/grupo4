extends Node2D

#mudança de cena e efeito sonoro ao clicar no personagem Tonhão
func _on_botoTonho_pressed():
	#alterando texturas dos botões para não serem interativas após um ser pressionado
	$"botãoTonhão".texture_normal = preload("res://assets_mytruck/face/tonhão_rindo.png")
	$"botãoNina".texture_hover = null
	$"botãoGina".texture_hover = null
	$"botãoSeuJorge".texture_hover = null
	
	if !$"SomConfirmação".playing:
		$"SomConfirmação".play()
		yield(get_tree().create_timer(0.65), "timeout")
		get_tree().change_scene("res://Cenas/Caminhões.tscn")


#mudança de cena e efeito sonoro ao clicar no personagem Seu Jorge
func _on_botoSeuJorge_pressed():
	#alterando texturas dos botões para não serem interativas após um ser pressionado
	$"botãoSeuJorge".texture_normal = preload("res://assets_mytruck/face/seujorge_rindo.png")
	$"botãoNina".texture_hover = null
	$"botãoTonhão".texture_hover = null
	$"botãoGina".texture_hover = null
	
	if !$"SomConfirmação".playing:
		$"SomConfirmação".play()
		yield(get_tree().create_timer(0.65), "timeout")
		get_tree().change_scene("res://Cenas/Caminhões.tscn")


#mudança de cena e efeito sonoro ao clicar na personagem Gina
func _on_botoGina_pressed():
	#alterando texturas dos botões para não serem interativas após um ser pressionado
	$"botãoGina".texture_normal = preload("res://assets_mytruck/face/gina_rindo.png")
	$"botãoNina".texture_hover = null
	$"botãoTonhão".texture_hover = null
	$"botãoSeuJorge".texture_hover = null
	
	if !$"SomConfirmação".playing:
		$"SomConfirmação".play()
		yield(get_tree().create_timer(0.65), "timeout")
		get_tree().change_scene("res://Cenas/Caminhões.tscn")


#mudança de cena e efeito sonoro ao clicar na personagem Nina
func _on_botoNina_pressed():
	#alterando texturas dos botões para não serem interativas após um ser pressionado
	$"botãoNina".texture_normal = preload("res://assets_mytruck/face/nina_rindo.png")
	$"botãoGina".texture_hover = null
	$"botãoTonhão".texture_hover = null
	$"botãoSeuJorge".texture_hover = null
	
	if !$"SomConfirmação".playing:
		$"SomConfirmação".play()
		yield(get_tree().create_timer(0.65), "timeout")
		get_tree().change_scene("res://Cenas/Caminhões.tscn")

#botão para voltar para a tela anterior e efeito sonoro
func _on_botoVoltar_pressed():
	#alterando texturas dos botões para não serem interativas após um ser pressionado
	$"botãoNina".texture_hover = null
	$"botãoGina".texture_hover = null
	$"botãoTonhão".texture_hover = null
	$"botãoSeuJorge".texture_hover = null
	
	if !$SomVoltar.playing:
		$SomVoltar.play()
		yield(get_tree().create_timer(0.35), "timeout")
		get_tree().change_scene("res://Cenas/nome.tscn")



	
