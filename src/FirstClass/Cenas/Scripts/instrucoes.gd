extends Node2D
var hover = 0
#guarda o valor que define se o efeito sonoro de hover deve tocar ou não
		
func _ready(): #tradução
	if Global.lingua == "eng":
		$INSTRUCOES.text = "Instructions"
		$BOTOES.text = "Buttons that will be use:"
		$BEBIDAS.text = "        Drunk driving \n Drinking while driving will \n blur the player's image"
		$CELULAR.text = "        Cellphone use \n Driving while using the \n cellphone will make the \n driver lose control of \n           his truck"
		$CARGAS.text = "         Excessive weight \n Too much weight on the \n truck will make it harder to \n                   turn"
		$SONO.text = "           Sleepiness \n Rest is essential. Tiredness \n  will cause your eyes to \n     close involuntarily"
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
