extends Node2D


func _ready():
	$Player/Camera2D.limit_bottom = 2048
	$Player/Camera2D.limit_right = 2960
	$Player/Camera2D.limit_left = 0
	$Player/Camera2D.limit_top = -160
	#Comandos resposáveis por definir limites em pixeis de até onde a camera pode ir em cada direção
	#Essencial para que o player não veja fora do mapa e que o minimapa fique "Estático" e não se movendo
	#Com o jogador
	
	$Player.max_speed = 150
	#Controle da velocidade máxima que o Player pode ter nesse mapa
