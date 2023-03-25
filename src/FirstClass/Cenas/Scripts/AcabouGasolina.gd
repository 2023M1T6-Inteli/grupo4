extends Node2D

func _ready():
	self.hide() #escondendo a mensagem ao iniciar o jogo
	if Global.lingua == "esp":
		$AcabouTexto.text = "Su nafta terminó...Juego terminado!"
	if Global.lingua == "eng":
		$AcabouTexto.text = "You're out of gas... Game Over!"


func _on_AcabouAnimacao_animation_finished(anim_name):
	get_tree().change_scene("res://Cenas/TelaGameOver.tscn")
#mudando para a cena de game over
