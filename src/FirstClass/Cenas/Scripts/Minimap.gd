extends Control

onready var mundo = preload("res://Cenas/World.tscn")
var mm

func set_mm():
	mm = mundo.instance()
	$ViewportContainer/Viewport.add_child(mm)

func _ready():
	set_mm()
	$ViewportContainer/Viewport/World/Camera2D.zoom = Vector2 (64,64)
