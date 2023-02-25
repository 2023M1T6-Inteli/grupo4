extends Node2D

#mudança de cena para ir para o menu e efeito sonoro
func _on_menu_pressed():
	#alterando texturas dos botões para não serem interativas após um ser pressionado
	$menu.texture_normal = preload("res://Sprites/botão_verde2.png")
	$restart.texture_hover = null
	
	if !$SomConfirmar.playing:
		$SomConfirmar.play()
		yield(get_tree().create_timer(0.25), "timeout")
		get_tree().change_scene("res://Cenas/Menu.tscn")

#mudança de cena para iniciar o jogo novamente e efeito sonoro
func _on_restart_pressed():
	#alterando texturas dos botões para não serem interativas após um ser pressionado
	$restart.texture_normal = preload("res://Sprites/botão_verde2.png")
	$menu.texture_hover = null
	
	if !$SomConfirmar.playing:
		$SomConfirmar.play()
		yield(get_tree().create_timer(0.35), "timeout")
		get_tree().change_scene("res://Cenas/Game.tscn")
