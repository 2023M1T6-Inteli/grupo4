extends Node2D



func _on_botoCloro_pressed():
	$"botãoCloro".texture_normal = preload("res://assets_mytruck/face/sombra_caminhão_cloro.png")
	$"botãoSoda".texture_hover = null
	$"botãoPvc".texture_hover = null
	Global.cargaDoCaminhao = 1
	#alterando texturas dos botões para não serem interativas após um ser pressionado
	
	if !$SomConfirmar.playing:
		$SomConfirmar.play()
		yield(get_tree().create_timer(0.5), "timeout")
		get_tree().change_scene("res://Cenas/Game.tscn")
	#mudança de cena e efeito sonoro

func _on_botoSoda_pressed():
	$"botãoSoda".texture_normal = preload("res://assets_mytruck/face/sombra_caminhão_soda.png")
	$"botãoPvc".texture_hover = null
	$"botãoCloro".texture_hover = null
	Global.cargaDoCaminhao = 2
	#alterando texturas dos botões para não serem interativas após um ser pressionado
		
	if !$SomConfirmar.playing:
		$SomConfirmar.play()
		yield(get_tree().create_timer(0.5), "timeout")
		get_tree().change_scene("res://Cenas/Game.tscn")
	#mudança de cena e efeito sonoro

func _on_botoPvc_pressed():
	$"botãoPvc".texture_normal = preload("res://assets_mytruck/face/sombra_caminhão_pvc.png")
	$"botãoSoda".texture_hover = null
	$"botãoCloro".texture_hover = null
	Global.cargaDoCaminhao = 3
	#alterando texturas dos botões para não serem interativas após um ser pressionado
	
	if !$SomConfirmar.playing:
		$SomConfirmar.play()
		yield(get_tree().create_timer(0.5), "timeout")
		get_tree().change_scene("res://Cenas/Game.tscn")
	#mudança de cena e efeito sonoro

func _on_botoVoltar_pressed():
	$"botãoSoda".texture_hover = null
	$"botãoPvc".texture_hover = null
	$"botãoCloro".texture_hover = null
	#alterando texturas dos botões para não serem interativas após um ser pressionado
	
	if !$SomVoltar.playing:
		$SomVoltar.play()
		yield(get_tree().create_timer(0.35), "timeout")
		get_tree().change_scene("res://Cenas/instrutores.tscn")
	#mudança de cena e efeito sonoro
