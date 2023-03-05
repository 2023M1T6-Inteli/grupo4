extends Node2D

func _ready():
	$"Player/Camera2D".limit_bottom = 2750
	$"Player/Camera2D".limit_top = 0
	$"Player/Camera2D".limit_left = 0
	$"Player/Camera2D".limit_right = 3650

