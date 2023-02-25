extends Node2D

#mudança de tela para prosseguir 
func _on_botoOk_pressed():
	#garantindo que algum texto será inserido para prosseguir
	if $LineEdit.text == "":
		pass
	else:
		if !$SomConfirmar.playing:
			$SomConfirmar.play()
			yield(get_tree().create_timer(0.45), "timeout")
			get_tree().change_scene("res://Cenas/instrutores.tscn") #mudança para a tela de instrutores e efeito sonoro

#mudança de tela para voltar
func _on_botoVoltar_pressed():
	if !$SomVoltar.playing:
		$SomVoltar.play()
		yield(get_tree().create_timer(0.35), "timeout")
		get_tree().change_scene("res://Cenas/menu.tscn") #mudança para a tela de menu e efeito sonoro

#permitindo o avanço para outra cena utilizando a tecla "Enter" também
func _on_LineEdit_text_entered(new_text):
	#garantindo que algum texto será inserido para prosseguir
	if new_text == "":
		pass
	else:
		if !$SomConfirmar.playing:
			$SomConfirmar.play()
			yield(get_tree().create_timer(0.45), "timeout")
			get_tree().change_scene("res://Cenas/instrutores.tscn") #mudança para a tela de instrutores e efeito sonoro
