extends Node2D


func _ready():
	if Global.mapa == 1:
		$ViewportContainer/Viewport/Mapa1/Player/Camera2D.current = true
		$ViewportContainer/Viewport/Mapa2/Player/Camera2D.current = false
		$ViewportContainer/Viewport/Mapa2.queue_free()
		
	
		$ViewportContainer/Viewport/Mapa1/Player/Camera2D.limit_bottom = 2560
		$ViewportContainer/Viewport/Mapa1/Player/Camera2D.limit_top = 0
		$ViewportContainer/Viewport/Mapa1/Player/Camera2D.limit_right = 3552
		$ViewportContainer/Viewport/Mapa1/Player/Camera2D.limit_left = 0
		
	if Global.mapa == 2:
		$ViewportContainer/Viewport/Mapa2/Player/Camera2D.current = true
		$ViewportContainer/Viewport/Mapa1/Player/Camera2D.current = false
		$ViewportContainer/Viewport/Mapa1.queue_free()
		
		$ViewportContainer/Viewport/Mapa2/Player/Camera2D.limit_bottom = 3700
		$ViewportContainer/Viewport/Mapa2/Player/Camera2D.limit_top = 0
		$ViewportContainer/Viewport/Mapa2/Player/Camera2D.limit_right = 4350
		$ViewportContainer/Viewport/Mapa2/Player/Camera2D.limit_left = 0
