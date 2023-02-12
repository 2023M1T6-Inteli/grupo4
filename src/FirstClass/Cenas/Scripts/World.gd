extends Node2D
onready var minimapa = preload("res://Cenas/Minimap.tscn")
var mapa

func set_mapa():
	mapa = minimapa.instance()
	$Camera2D.add_child(mapa)

func _ready():
	set_mapa()
