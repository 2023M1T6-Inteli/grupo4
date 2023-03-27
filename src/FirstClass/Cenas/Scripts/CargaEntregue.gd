extends Node2D


func _ready():
	self.hide() #escondendo a mensagem por padrão
	if Global.lingua == "esp":
		$TextoCarga.text = "Carga presentada!\nNafta abastecida!"
	if Global.lingua == "eng":
		$TextoCarga.text = "Cargo delivered!\nGasoline refueled!"
	#traduções
