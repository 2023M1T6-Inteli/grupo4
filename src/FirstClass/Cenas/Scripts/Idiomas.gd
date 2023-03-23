extends Node2D

var hover = 0

func som_hover():
	if hover == 0:
		$SomHover.play()

#funções que selecionam o idioma do jogo de acordo com o botão pressionado pelo jogador na tela idiomas
func _on_BotaoPt_pressed():
	$Transicao/fill/AnimationPlayer.play("Fora")
	hover = 1
	Global.lingua = "pt"
	if !$SomConfirmar.playing:
		$SomConfirmar.play()
		yield(get_tree().create_timer(0.25), "timeout")
		get_tree().change_scene("res://Cenas/Menu.tscn")

func _on_BotaoEsp_pressed():
	$Transicao/fill/AnimationPlayer.play("Fora")
	hover = 1
	Global.lingua = "esp"
	if !$SomConfirmar.playing:
		$SomConfirmar.play()
		yield(get_tree().create_timer(0.25), "timeout")
		get_tree().change_scene("res://Cenas/Menu.tscn")


func _on_BotaoEng_pressed():
	$Transicao/fill/AnimationPlayer.play("Fora")
	hover = 1
	Global.lingua = "eng"
	if !$SomConfirmar.playing:
		$SomConfirmar.play()
		yield(get_tree().create_timer(0.25), "timeout")
		get_tree().change_scene("res://Cenas/Menu.tscn")


#volta para a cena de menu
func _on_BotaoVoltar_pressed():
	$Transicao/fill/AnimationPlayer.play("Fora")
	hover = 1
	if !$SomVoltar.playing:
		$SomVoltar.play()
		yield(get_tree().create_timer(0.25), "timeout")
		get_tree().change_scene("res://Cenas/Menu.tscn")


func _on_BotaoPt_mouse_entered():
	som_hover()

func _on_BotaoEsp_mouse_entered():
	som_hover()

func _on_BotaoEng_mouse_entered():
	som_hover()

func _on_BotaoVoltar_mouse_entered():
	som_hover()
