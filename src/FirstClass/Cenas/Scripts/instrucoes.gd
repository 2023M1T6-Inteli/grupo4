extends Node2D
var hover = 0
#guarda o valor que define se o efeito sonoro de hover deve tocar ou não


#botão para voltar para a cena anterior e efeito sonoro
func _on_BotaoVoltar_pressed():
	hover = 1
	if !$SomVoltar.playing:
		$SomVoltar.play()
		yield(get_tree().create_timer(0.25), "timeout")
		get_tree().change_scene("res://Cenas/menu.tscn")

func _on_BotaoVoltar_mouse_entered():
	if hover == 0:
		$SomHover.play()
