extends Node2D

var hover = 0
#guarda o valor que define se o efeito sonoro de hover deve tocar ou não

func _ready():
	if Global.lingua == "eng": #tradução
		$ESCOLHA.text = "   Choose your truck"
		$CLORO.text = "Chlorine"
	if Global.lingua == "esp":
		$ESCOLHA.text = "     Elige tu camion"


func confirmar():
	hover = 1
	if !$SomConfirmar.playing:
		$SomConfirmar.play()
		yield(get_tree().create_timer(0.5), "timeout")
		get_tree().change_scene("res://Cenas/interacao1.tscn")
		#mudança de cena e efeito sonoro
		
func hover_sound():
	if hover == 0:
		$SomHover.play()
	#efeito sonoro que toca quando o mouse está em algum botão

func _on_BotaoCloro_pressed():
	$BotaoCloro.texture_normal = $BotaoCloro.texture_hover
	$BotaoSoda.texture_hover = null
	$BotaoPvc.texture_hover = null
	Global.cargaDoCaminhao = 1
	confirmar()
	#alterando texturas dos botões para não serem interativas após um ser pressionado

func _on_BotaoSoda_pressed():
	$BotaoSoda.texture_normal = $BotaoSoda.texture_hover
	$BotaoPvc.texture_hover = null
	$BotaoCloro.texture_hover = null
	Global.cargaDoCaminhao = 2
	confirmar()
	#alterando texturas dos botões para não serem interativas após um ser pressionado

func _on_BotaoPvc_pressed():
	$BotaoPvc.texture_normal = $BotaoPvc.texture_hover
	$BotaoSoda.texture_hover = null
	$BotaoCloro.texture_hover = null
	Global.cargaDoCaminhao = 3
	confirmar()
	#alterando texturas dos botões para não serem interativas após um ser pressionado

func _on_BotaoVoltar_pressed():
	$BotaoSoda.texture_hover = null
	$BotaoPvc.texture_hover = null
	$BotaoCloro.texture_hover = null
	#alterando texturas dos botões para não serem interativas após um ser pressionado
	hover = 1
	if !$SomVoltar.playing:
		$SomVoltar.play()
		yield(get_tree().create_timer(0.35), "timeout")
		get_tree().change_scene("res://Cenas/instrutores.tscn")
	#mudança de cena e efeito sonoro

#funções de efeito sonoro
func _on_BotaoCloro_mouse_entered():
	hover_sound()

func _on_BotaoSoda_mouse_entered():
	hover_sound()

func _on_BotaoPvc_mouse_entered():
	hover_sound()

func _on_BotaoVoltar_mouse_entered():
	hover_sound()
