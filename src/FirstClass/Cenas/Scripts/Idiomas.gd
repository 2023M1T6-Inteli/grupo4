extends Node2D

#funções que selecionam o idioma do jogo de acordo com o botão pressionado pelo jogador na tela idiomas
func _on_BotaoPt_pressed():
	Global.lingua = "pt"
	get_tree().change_scene("res://Cenas/Menu.tscn")

func _on_BotaoEsp_pressed():
	Global.lingua = "esp"
	get_tree().change_scene("res://Cenas/Menu.tscn")


func _on_BotaoEng_pressed():
	Global.lingua = "eng"
	get_tree().change_scene("res://Cenas/Menu.tscn")


#volta para a cena de menu
func _on_BotaoVoltar_pressed():
	get_tree().change_scene("res://Cenas/Menu.tscn")
