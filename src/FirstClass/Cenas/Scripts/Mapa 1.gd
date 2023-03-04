extends Node2D


func _ready():
	
	$Player/Camera2D.zoom = Vector2(0.5,0.5)
	$Player/Camera2D.zoom = Vector2(0.5,0.5)
	
	$Player/Camera2D.limit_bottom = 2688
	$Player/Camera2D.limit_right = 3584
	$Player/Camera2D.limit_left = 64
	$Player/Camera2D.limit_top = 0
	#Comandos resposáveis por definir limites em pixeis de até onde a camera pode ir em cada direção
	#Essencial para que o player não veja fora do mapa e que o minimapa fique "Estático" e não se movendo
	#Com o jogador
	
	$Player.maxSpeed = 120
	#Controle da velocidade máxima que o Player pode ter nesse mapa
