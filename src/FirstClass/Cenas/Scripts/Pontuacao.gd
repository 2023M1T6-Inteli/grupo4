extends Node2D

#função que mostra a pontuação do jogador
func _process(delta):
	$Pontos.text = str(Global.points / 12)
	
	if Global.notificacao == true:
		$Bonus.text = "+1000"
		$Timer.start()
		Global.notificacao = false
	
	#Função que mostra o valor do bônus logo após o adquirir


func _on_Timer_timeout():
	$Bonus.text = ""
	#Função que some com o valor do bônus após o tempo pre-determinado
