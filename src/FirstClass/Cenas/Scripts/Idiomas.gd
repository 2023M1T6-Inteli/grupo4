extends Node2D

#funções que selecionam o idioma do jogo de acordo com o botão pressionado pelo jogador na tela idiomas
func _on_BotaoPt_pressed():
	$Transicao/fill/AnimationPlayer.play("Fora")
	Global.lingua = "pt"
	get_tree().change_scene("res://Cenas/Menu.tscn")

func _on_BotaoEsp_pressed():
	$Transicao/fill/AnimationPlayer.play("Fora")
	Global.lingua = "esp"
	get_tree().change_scene("res://Cenas/Menu.tscn")


func _on_BotaoEng_pressed():
	$Transicao/fill/AnimationPlayer.play("Fora")
	Global.lingua = "eng"
	get_tree().change_scene("res://Cenas/Menu.tscn")


#volta para a cena de menu
func _on_BotaoVoltar_pressed():
	$Transicao/fill/AnimationPlayer.play("Fora")
	get_tree().change_scene("res://Cenas/Menu.tscn")
