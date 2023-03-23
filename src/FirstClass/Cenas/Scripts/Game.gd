extends Node2D

func _ready():
	$CanvasLayer/Pontuacao/Bonus.hide()
	$CanvasLayer/Pause.hide()

	if Global.mapa == 1: #selecionando o Mapa 1 (Floresta)
		$ViewportContainer/Viewport/Mapa1/Player/Camera2D.current = true
		$ViewportContainer/Viewport/Mapa2/Player/Camera2D.current = false
		$ViewportContainer/Viewport/Mapa2.queue_free()
		$ViewportContainer/Viewport/DebufsMapa2.queue_free()
		get_node("CanvasLayer/Minimap/ViewportContainer/Viewport/Mapa1/Cacamba/CollisionShape2D").disabled = true
		yield(get_tree().create_timer(0.1), "timeout")
		get_node("CanvasLayer/Minimap/ViewportContainer/Viewport/Mapa1/Cacamba/CollisionShape2D").disabled = false
		
	if Global.mapa == 2: #selecionando o Mapa 2 (Velho Oeste)
		$ViewportContainer/Viewport/Mapa2/Player/Camera2D.current = true
		$ViewportContainer/Viewport/Mapa1/Player/Camera2D.current = false
		$ViewportContainer/Viewport/Mapa1.queue_free()
		$ViewportContainer/Viewport/DebufsMapa1.queue_free()
		get_node("CanvasLayer/Minimap/ViewportContainer/Viewport/Mapa2/Cacamba/CollisionShape2D").disabled = true
		yield(get_tree().create_timer(0.1), "timeout")
		get_node("CanvasLayer/Minimap/ViewportContainer/Viewport/Mapa2/Cacamba/CollisionShape2D").disabled = false

func _process(delta):

	get_node("CanvasLayer/Pontuacao/Pontos").text = str(Global.points / 12)
	
	if Global.mapa == 1:
		if get_node("CanvasLayer/Minimap/ViewportContainer/Viewport/Mapa1/Chegada").chegou == true and Global.permissao == true:
			get_node("CanvasLayer/Minimap/ViewportContainer/Viewport/Mapa1/Chegada").chegou = false
			Global.permissao = false
			$CanvasLayer/Pontuacao/Bonus.show()
			$CanvasLayer/Pontuacao/Timer.start()

		if get_node("CanvasLayer/Minimap/ViewportContainer/Viewport/Mapa1/Chegada").chegou2 == true and Global.permissao == false:
			get_node("CanvasLayer/Minimap/ViewportContainer/Viewport/Mapa1/Chegada").chegou2 = false
			Global.permissao = true
			$CanvasLayer/CargaEntregue/CargaAnimacao.play("Fade")
		
		if Global.gasolina == 0:
			$CanvasLayer/Minimap/ViewportContainer/Viewport/Mapa1/Player.set_physics_process(false)
			$CanvasLayer/AcabouGasolina/AcabouAnimacao.play("FadeInOut")
		
		
	elif Global.mapa == 2:
		if get_node("CanvasLayer/Minimap/ViewportContainer/Viewport/Mapa2/Chegada").chegou == true and Global.permissao == true:
			get_node("CanvasLayer/Minimap/ViewportContainer/Viewport/Mapa2/Chegada").chegou = false
			Global.permissao = false
			$CanvasLayer/Pontuacao/Bonus.show()
			$CanvasLayer/Pontuacao/Timer.start()

		if get_node("CanvasLayer/Minimap/ViewportContainer/Viewport/Mapa2/Chegada").chegou2 == true and Global.permissao == false:
			get_node("CanvasLayer/Minimap/ViewportContainer/Viewport/Mapa2/Chegada").chegou2 = false
			Global.permissao = true
			$CanvasLayer/CargaEntregue/CargaAnimacao.play("Fade")
	
		if Global.gasolina == 0:
			$CanvasLayer/Minimap/ViewportContainer/Viewport/Mapa2/Player.set_physics_process(false)
			$CanvasLayer/AcabouGasolina/AcabouAnimacao.play("FadeInOut")

	if Input.is_action_just_pressed("esc"):
		$CanvasLayer/Pause.show()
		get_tree().paused = true
		
func _on_BotaoContinuar_pressed():
	$CanvasLayer/Pause.hide()
	get_tree().paused = false


func _on_BotaoRecomecar_pressed():
	if Global.dificuldade == "Facil":
		Global.gasolina = 115.0
		
	if Global.dificuldade == "Medio":
		Global.gasolina = 105.0
		
	if Global.dificuldade == "Dificil":
		Global.gasolina = 50.0
	
	Global.points = 0
	Global.gasolina
	get_tree().reload_current_scene()
	get_tree().paused = false

func _on_BotaoMenu_pressed():
	get_tree().paused = false
	MusicController.play_menu_music()
	get_tree().change_scene("res://Cenas/Menu.tscn")


func _on_BotaoDificuldade_pressed():
	get_tree().paused = false
	MusicController.play_menu_music()
	get_tree().change_scene("res://Cenas/EscolhaInGame.tscn")
