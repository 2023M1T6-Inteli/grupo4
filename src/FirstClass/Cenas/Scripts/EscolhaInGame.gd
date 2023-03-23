extends Node2D

var hover = 0

func _ready():
	if Global.lingua == "eng":
		$Dificuldade.text = "Difficulty"
		$ldfacil.text = "Easy"
		$lddificil.text = "Hard"
		$ldmedio.text = "Medium"
	
	if Global.lingua == "esp":
		$Dificuldade.text = "Dificultad"
		$ldmedio.text = "Normal"

func _on_BotaoFacil_pressed():
	Global.dificuldade = "Facil"
	MusicController.play_game_music()
	get_tree().change_scene("res://Cenas/Game.tscn")

func _on_BotaoMedio_pressed():
	Global.dificuldade = "Medio"
	MusicController.play_game_music()
	get_tree().change_scene("res://Cenas/Game.tscn")


func _on_BotaoDificil_pressed():
	Global.dificuldade = "Dificil"
	MusicController.play_game_music()
	get_tree().change_scene("res://Cenas/Game.tscn")

#Os botões salvam a dificuldade em uma variavel global
