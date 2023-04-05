extends Node2D
var hover = 0
#guarda o valor que define se o efeito sonoro de hover deve tocar ou não
		
func _ready(): #tradução
	if Global.lingua == "eng":
		$INSTRUCOES.text = "Instructions"
		$BOTOES.text = "Buttons that will be use:"
		$BEBIDAS.text = "Drunk driving\nDrinking while driving will blur the player's image"
		$CELULAR.text = "Cellphone use\nDriving while using the cellphone will make the driver lose control of his truck"
		$CARGAS.text = "Excessive weight\nToo much weight on the truck will make it harder to turn"
		$SONO.text = "Sleepiness\nRest is essential. Tiredness will cause your eyes to close involuntarily"
	if Global.lingua == "esp":
		$INSTRUCOES.text = "Instrucciones"
		$BOTOES.text = "Botones que se utilizaran:"
		$BEBIDAS.text = "Consumo de alcohol\nAl consumir bebidas la vision del jugador se vuelve borrasa"
		$CELULAR.text = "Celular\nEl uso del celular hace que el conductor pierda el control"
		$CARGAS.text = "Cargas excesivas\nLas cargas excesivas hacen que el amion patine en la via"
		$SONO.text = "Sueno\nEl descanso es fundamental. El sueno provoca el cierre involuntario de los ojos"

#botão para voltar para a cena anterior e efeito sonoro
func _on_BotaoVoltar_pressed():
	$Transicao/fill/AnimationPlayer.play("Fora")
	hover = 1
	if !$SomVoltar.playing:
		$SomVoltar.play()
		yield(get_tree().create_timer(0.25), "timeout")
		get_tree().change_scene("res://Cenas/Menu.tscn")

func _on_BotaoVoltar_mouse_entered():
	if hover == 0:
		$SomHover.play()
