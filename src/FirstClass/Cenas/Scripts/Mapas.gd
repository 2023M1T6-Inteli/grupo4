extends Node2D
var hover = 0
func _ready():
	if Global.lingua == "eng":
		$Mapa1.text = "Florest"
		$Mapa2.text = "Old West"
	if Global.lingua == "esp":
		$Mapa1.text = "Bosque"
		$Mapa2.text = "Viejo Oeste"
#traduzindo o nome do mapa de acordo com a linguagem selecionada

func som_hover():
	if hover == 0:
		$SomHover.play()

#funções de seleção do mapa de acordo com botão pressionado pelo player
func _on_BotaoMapa1_pressed():
	hover = 1
	$Transicao/fill/AnimationPlayer.play("Fora")
	Global.mapa = 1
	if !$SomConfirmar.playing:
		$SomConfirmar.play()
		yield(get_tree().create_timer(0.5), "timeout")
		get_tree().change_scene("res://Cenas/Interacao1.tscn")


func _on_BotaoMapa2_pressed():
	hover = 1
	$Transicao/fill/AnimationPlayer.play("Fora")
	Global.mapa = 2
	if !$SomConfirmar.playing:
		$SomConfirmar.play()
		yield(get_tree().create_timer(0.5), "timeout")
		get_tree().change_scene("res://Cenas/Interacao1.tscn")
	

#voltar a cena de seleção de caminhões
func _on_BotaoVoltar_pressed():
	hover = 1
	$Transicao/fill/AnimationPlayer.play("Fora")
	if !$SomVoltar.playing:
		$SomVoltar.play()
		yield(get_tree().create_timer(0.5), "timeout")
		get_tree().change_scene("res://Cenas/Escolha.tscn")


func _on_BotaoVoltar_mouse_entered():
	som_hover()

func _on_BotaoMapa2_mouse_entered():
	som_hover()

func _on_BotaoMapa1_mouse_entered():
	som_hover()
