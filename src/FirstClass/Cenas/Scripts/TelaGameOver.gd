extends Node2D

var hover = 0
#guarda o valor que define se o efeito sonoro de hover deve tocar ou não

func _ready():
	Global.debuf = false
	Global.debuf2 = false
	Global.permissao = false
	#garantindo que os debuffs, a gasolina e a variável "permissao" são reiniciados
	
	
	if Global.dificuldade == "Facil":
		Global.gasolina = 115.0
		
	if Global.dificuldade == "Medio":
		Global.gasolina = 105.0
		
	if Global.dificuldade == "Dificil":
		Global.gasolina = 90.0
	#defini o tempo para finalizar a gasolina em função da dificuldade
	
	$Pontos.text = "Parabéns " + str(Global.nome) + ", você fez " + str(Global.points / 12) + " reais!"
	#mostrando os pontos com uma mensagem
	
	if Global.lingua == "eng":
		$OVER.text = "GAME OVER"
		$RESTART.text = "Restart"
		$TextoCreditos.text = "Credits"
		$Pontos.text = "Congratulations " + str(Global.nome) + ", you made " + str(Global.points/12)+" dollars!"
	
	if Global.lingua == "esp":
		$OVER.text = "FIN DEL JUEGO"
		$RESTART.text = "Reanudar"
		$TextoCreditos.text = "Creditos"
		$Pontos.text = "Felicitaciones " + str(Global.nome) + ", has conseguido " + str(Global.points/12)+ " pesos!"
	MusicController.debuffs1_sound_off()
	MusicController.debuffs2_sound_off()
	MusicController.play_game_over_music()
	#tocando a música certa
	
func som_hover():
	if hover == 0:
		$SomHover.play()

func _on_menu_pressed():
	$Transicao/fill/AnimationPlayer.play("Fora")
	#alterando texturas dos botões para não serem interativas após um ser pressionado
	$menu.texture_normal = $menu.texture_hover
	$restart.texture_hover = null
	$Creditos.texture_hover = null
	
	#reiniciando a pontuação
	Global.points = 0
	
	hover = 1
	if !$SomConfirmar.playing:
		$SomConfirmar.play()
		yield(get_tree().create_timer(0.25), "timeout")
		MusicController.play_menu_music()
		get_tree().change_scene("res://Cenas/Menu.tscn")
	#mudança de cena e efeito sonoro
	
func _on_restart_pressed():
	$Transicao/fill/AnimationPlayer.play("Fora")
	#alterando texturas dos botões para não serem interativas após um ser pressionado
	$restart.texture_normal = $restart.texture_hover
	$menu.texture_hover = null
	$Creditos.texture_hover = null
	#reiniciando a pontuação
	Global.points = 0
		
	hover = 1
	if !$SomConfirmar.playing:
		$SomConfirmar.play()
		yield(get_tree().create_timer(0.25), "timeout")
		MusicController.play_game_music()
		get_tree().change_scene("res://Cenas/Game.tscn")
#mudança de cena e efeito sonoro


func _on_Creditos_pressed():
	$Transicao/fill/AnimationPlayer.play("Fora")
	$restart.texture_hover = null
	$menu.texture_hover = null
	$Creditos.texture_normal = $Creditos.texture_hover

	hover = 1
	if !$SomConfirmar.playing:
		$SomConfirmar.play()
		yield(get_tree().create_timer(0.25), "timeout")
		MusicController.play_menu_music()
		get_tree().change_scene("res://Cenas/Menu.tscn")

#funções de efeito sonoro
func _on_restart_mouse_entered():
	som_hover()

func _on_menu_mouse_entered():
	som_hover()

func _on_Creditos_mouse_entered():
	som_hover()

