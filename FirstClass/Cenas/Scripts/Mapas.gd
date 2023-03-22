extends Node2D

func _ready():
	if Global.lingua == "eng":
		$Mapa1.text = "Florest"
		$Mapa2.text = "Old West"
	if Global.lingua == "esp":
		$Mapa1.text = "Bosque"
		$Mapa2.text = "Viejo Oeste"
#traduzindo o nome do mapa de acordo com a linguagem selecionada


#funções de seleção do mapa de acordo com botão pressionado pelo player
func _on_BotaoMapa1_pressed():
	Global.mapa = 1
	get_tree().change_scene("res://Cenas/Interacao1.tscn")


func _on_BotaoMapa2_pressed():
	Global.mapa = 2
	get_tree().change_scene("res://Cenas/Interacao1.tscn")
	

#voltar a cena de seleção de caminhões
func _on_BotaoVoltar_pressed():
	get_tree().change_scene("res://Cenas/Caminhoes.tscn")
