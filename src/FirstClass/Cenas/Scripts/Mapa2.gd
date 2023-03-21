extends Node2D


func _ready():
	if Global.mapa == 2:
		$Player/Camera2D.limit_bottom = 3700
		$Player/Camera2D.limit_top = 0
		$Player/Camera2D.limit_right = 4350
		$Player/Camera2D.limit_left = 0
