extends Node2D

var hover = 0
#guarda o valor que define se o efeito sonoro de hover deve tocar ou não

func confirmar():
	hover = 1
	if !$SomConfirmar.playing:
		$SomConfirmar.play()
		yield(get_tree().create_timer(0.5), "timeout")
		get_tree().change_scene("res://Cenas/Game.tscn")
		#mudança de cena e efeito sonoro
		
func hover_sound():
	if hover == 0:
		$SomHover.play()
	#efeito sonoro que toca quando o mouse está em algum botão

func _on_botoCloro_pressed():
	$"botãoCloro".texture_normal = $"botãoCloro".texture_hover
	$"botãoSoda".texture_hover = null
	$"botãoPvc".texture_hover = null
	Global.cargaDoCaminhao = 1
	confirmar()
	#alterando texturas dos botões para não serem interativas após um ser pressionado
	

func _on_botoSoda_pressed():
	$"botãoSoda".texture_normal = $"botãoSoda".texture_hover
	$"botãoPvc".texture_hover = null
	$"botãoCloro".texture_hover = null
	Global.cargaDoCaminhao = 2
	confirmar()
	#alterando texturas dos botões para não serem interativas após um ser pressionado


func _on_botoPvc_pressed():
	$"botãoPvc".texture_normal = $"botãoPvc".texture_hover
	$"botãoSoda".texture_hover = null
	$"botãoCloro".texture_hover = null
	Global.cargaDoCaminhao = 3
	confirmar()
	#alterando texturas dos botões para não serem interativas após um ser pressionado

func _on_botoVoltar_pressed():
	$"botãoSoda".texture_hover = null
	$"botãoPvc".texture_hover = null
	$"botãoCloro".texture_hover = null
	#alterando texturas dos botões para não serem interativas após um ser pressionado
	hover = 1
	if !$SomVoltar.playing:
		$SomVoltar.play()
		yield(get_tree().create_timer(0.35), "timeout")
		get_tree().change_scene("res://Cenas/instrutores.tscn")
	#mudança de cena e efeito sonoro


#funções de efeito sonoro
func _on_botoCloro_mouse_entered():
	hover_sound()

func _on_botoSoda_mouse_entered():
	hover_sound()

func _on_botoPvc_mouse_entered():
	hover_sound()

func _on_botoVoltar_mouse_entered():
	hover_sound()
