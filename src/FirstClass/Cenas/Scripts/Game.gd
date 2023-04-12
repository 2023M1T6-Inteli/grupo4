extends Node2D

#traduzindo caso necessário, escondendo o pause e configurando o cenário de acordo com o mapa escolhido
func _ready():
	$GameMusic.play()
	$CanvasLayer/Pontuacao/Bonus.hide()
	$CanvasLayer/Pause.hide()

	if Global.lingua == "eng":
		$CanvasLayer/Pause/Recomecar.text = "Restart"
		$CanvasLayer/Pause/Continuar.text = "Continue"
		$CanvasLayer/Pause/Dificuldade.text = "Difficulty"
		$CanvasLayer/Gas.text = "Gasoline"
	
	if Global.lingua == "esp":
		$CanvasLayer/Pause/Recomecar.text = "Reanudar"
		$CanvasLayer/Pause/Dificuldade.text = "Dificultad"
		$CanvasLayer/Gas.text = "Nafta"


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

	get_node("CanvasLayer/Pontuacao/Pontos").text = str(Global.points / 12) #atualizando a pontuação
	
	if Global.mapa == 1:
		if get_node("CanvasLayer/Minimap/ViewportContainer/Viewport/Mapa1/Chegada").chegou == true and Global.permissao == true:
			get_node("CanvasLayer/Minimap/ViewportContainer/Viewport/Mapa1/Chegada").chegou = false
			Global.permissao = false
			$CanvasLayer/Pontuacao/Bonus.show()
			$CanvasLayer/Pontuacao/Timer.start()
			#bônus de quando o player percorre todo o mapa no mapa da floresta

		if get_node("CanvasLayer/Minimap/ViewportContainer/Viewport/Mapa1/Chegada").chegou2 == true and Global.permissao == false:
			get_node("CanvasLayer/Minimap/ViewportContainer/Viewport/Mapa1/Chegada").chegou2 = false
			Global.permissao = true
			$CanvasLayer/CargaEntregue/CargaAnimacao.play("Fade")
		#mensagem que aparece quando o player percorre metade do mapa
		if Global.gasolina == 0:
			get_node("CanvasLayer/Minimap/ViewportContainer/Viewport/Mapa1/Player").set_physics_process(false)
			$CanvasLayer/AcabouGasolina/AcabouAnimacao.play("FadeInOut")
		#game over caso a gasolina chegue a 0
		
	elif Global.mapa == 2:
		if get_node("CanvasLayer/Minimap/ViewportContainer/Viewport/Mapa2/Chegada").chegou == true and Global.permissao == true:
			get_node("CanvasLayer/Minimap/ViewportContainer/Viewport/Mapa2/Chegada").chegou = false
			Global.permissao = false
			$CanvasLayer/Pontuacao/Bonus.show()
			$CanvasLayer/Pontuacao/Timer.start()
			#bônus de quando o player percorre o mapa 2 todo
			
		if get_node("CanvasLayer/Minimap/ViewportContainer/Viewport/Mapa2/Chegada").chegou2 == true and Global.permissao == false:
			get_node("CanvasLayer/Minimap/ViewportContainer/Viewport/Mapa2/Chegada").chegou2 = false
			Global.permissao = true
			$CanvasLayer/CargaEntregue/CargaAnimacao.play("Fade")
			#mensagem que aparece quando o player percorre metade do mapa
		if Global.gasolina == 0:
			get_node("CanvasLayer/Minimap/ViewportContainer/Viewport/Mapa2/Player").set_physics_process(false)
			$CanvasLayer/AcabouGasolina/AcabouAnimacao.play("FadeInOut")
			#game over quando a gasolina chega a 0

	if Input.is_action_just_pressed("esc"):
		$CanvasLayer/Pause.show()
		get_tree().paused = true
		#pausando ao apertar "esc"
		
#despausando
func _on_BotaoContinuar_pressed():
	$CanvasLayer/Pause.hide()
	get_tree().paused = false

#recomeçando o jogo
func _on_BotaoRecomecar_pressed():
	if Global.dificuldade == "Facil":
		Global.gasolina = 145.0
		
	if Global.dificuldade == "Medio":
		Global.gasolina = 105.0
		
	if Global.dificuldade == "Dificil":
		Global.gasolina = 90.0
	Global.permissao = false
	Global.points = 0
	LoadingScreen.load_scene(self, "res://Cenas/Game.tscn")
	get_tree().paused = false

#retornando ao menu
func _on_BotaoMenu_pressed():
	if Global.dificuldade == "Facil":
		Global.gasolina = 145.0
		
	if Global.dificuldade == "Medio":
		Global.gasolina = 105.0
		
	if Global.dificuldade == "Dificil":
		Global.gasolina = 90.0
	Global.permissao = false
	Global.points = 0
	get_tree().paused = false
	MusicController.play_menu_music()
	self.queue_free()
	get_tree().change_scene("res://Cenas/Menu.tscn")

#leva à cena de mudar a dificuldade
func _on_BotaoDificuldade_pressed():
	if Global.dificuldade == "Facil":
		Global.gasolina = 145.0
		
	if Global.dificuldade == "Medio":
		Global.gasolina = 105.0
		
	if Global.dificuldade == "Dificil":
		Global.gasolina = 90.0
	Global.permissao = false
	Global.points = 0
	get_tree().paused = false
	MusicController.play_menu_music()
	self.queue_free()
	get_tree().change_scene("res://Cenas/EscolhaInGame.tscn")
