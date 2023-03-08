extends Node2D

#função que mostra a pontuação do jogador
func _process(delta):
	$Pontos.text = str(Global.points / 12)
	
	if Global.notificacao == true:
		$Bonus.text = "+1000"
		$Timer.start()
		Global.notificacao = false


func _on_Timer_timeout():
	$Bonus.text = ""
