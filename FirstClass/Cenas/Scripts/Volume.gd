extends Node2D

#guarda o valor que define se o efeito sonoro de hover deve tocar ou não
var hover = 0

#obtem o índice do buff de áudio que queremos usar e salva como uma variável
var master_bus = AudioServer.get_bus_index("Master")

#botão para voltar para a cena anterior e efeito sonoro
func _on_BotaoVoltar_pressed():
	hover = 1
	if !$SomVoltar.playing:
		$SomVoltar.play()
		yield(get_tree().create_timer(0.25), "timeout")
		get_tree().change_scene("res://Cenas/Menu.tscn")

#altera o volume em décipeis de barramento de áudio
func _on_HSlider_value_changed(value):
	AudioServer.set_bus_volume_db(master_bus, value)
	
	#mover o volume se o controle deslizante for movido até o final
	if value == -30:
		AudioServer.set_bus_mute(master_bus,true)
	else:
		AudioServer.set_bus_mute(master_bus,false)

#função de efeito sonoro
func _on_BotaoVoltar_mouse_entered():
	if hover==0:
		$SomHover.play()
