extends Node2D


func _ready():
	if Global.mapa == 1:
		$Player/Camera2D.limit_bottom = 2560
		$Player/Camera2D.limit_top = 0
		$Player/Camera2D.limit_right = 3552
		$Player/Camera2D.limit_left = 0
