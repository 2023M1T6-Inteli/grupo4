extends Node2D


func _ready():
	if Global.mapa == 1:
		$ViewportContainer/Viewport/Mapa1/Player/Camera2D.current = true
		$ViewportContainer/Viewport/Mapa2/Player/Camera2D.current = false
		$ViewportContainer/Viewport/Mapa2.queue_free()
		$ViewportContainer/Viewport/DebufsMapa2.queue_free()
		#seleção do primeiro mapa
		
		
	if Global.mapa == 2:
		$ViewportContainer/Viewport/Mapa2/Player/Camera2D.current = true
		$ViewportContainer/Viewport/Mapa1/Player/Camera2D.current = false
		$ViewportContainer/Viewport/Mapa1.queue_free()
		$ViewportContainer/Viewport/DebufsMapa1.queue_free()
		#seleção do segundo mapa
