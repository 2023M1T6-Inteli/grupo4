extends Node2D

var hover = 0

#traduções
func _ready():
	if Global.lingua == "eng":
		$Dificuldade.text = "Difficulty"
		$ldfacil.text = "Easy"
		$lddificil.text = "Hard"
		$ldmedio.text = "Medium"
	
	if Global.lingua == "esp":
		$Dificuldade.text = "Dificultad"
		$ldmedio.text = "Normal"

#funções abaixo redefinem a dificuldade do jogo
func _on_BotaoFacil_pressed():
	Global.dificuldade = "Facil"
	LoadingScreen.load_scene(self, "res://Cenas/Game.tscn")

func _on_BotaoMedio_pressed():
	Global.dificuldade = "Medio"
	LoadingScreen.load_scene(self, "res://Cenas/Game.tscn")


func _on_BotaoDificil_pressed():
	Global.dificuldade = "Dificil"
	LoadingScreen.load_scene(self, "res://Cenas/Game.tscn")

#Os botões salvam a dificuldade em uma variavel global

