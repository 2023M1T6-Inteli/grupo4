extends Node2D

#função que mostra a pontuação do jogador
func _process(delta):
	$Pontos.text = "$" + str(Global.points / 12)
