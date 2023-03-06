extends Node2D

var hover = 0
#guarda o valor que define se o efeito sonoro de hover deve tocar ou não

func som_hover():
	if hover == 0:
		$SomHover.play()

func confirmar():
	hover = 1
	if !$SomConfirmar.playing:
		$SomConfirmar.play()
		yield(get_tree().create_timer(0.45), "timeout")
		get_tree().change_scene("res://Cenas/instrutores.tscn")
		#mudança para a tela de instrutores e efeito sonoro


#mudança de tela para prosseguir 
func _on_BotaoOk_pressed():
	#garantindo que algum texto será inserido para prosseguir
	if $LineEdit.text == "":
		pass
	else:
		confirmar()
		
#mudança de tela para voltar
func _on_BotaoVoltar_pressed():
	if !$SomVoltar.playing:
		$SomVoltar.play()
		yield(get_tree().create_timer(0.35), "timeout")
		get_tree().change_scene("res://Cenas/menu.tscn")
		#mudança para a tela de menu e efeito sonoro

#permitindo o avanço para outra cena utilizando a tecla "Enter" também
func _on_LineEdit_text_entered(new_text):
	#garantindo que algum texto será inserido para prosseguir
	if new_text == "":
		pass
	else:
		confirmar()


func _on_BotaoOk_mouse_entered():
	som_hover()


func _on_BotaoVoltar_mouse_entered():
	som_hover()


