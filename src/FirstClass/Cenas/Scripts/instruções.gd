extends Node2D

#botão para voltar para a cena anterior e efeito sonoro
func _on_botoVoltar_pressed():
	if !$SomVoltar.playing:
		$SomVoltar.play()
		yield(get_tree().create_timer(0.25), "timeout")
		get_tree().change_scene("res://Cenas/menu.tscn")
