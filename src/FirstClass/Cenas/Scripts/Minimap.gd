extends Control

func _ready():
	$"ViewportContainer/Viewport/Mapa 1/Player/Camera2D".zoom = Vector2(60,70)
	# Comando responsável por pegar a camera do Player e dar um zoom inverso, para que seja possível
	# ver o mapa inteiro dentro no minimapa


func _physics_process(delta):
	var player_position = $"ViewportContainer/Viewport/Mapa 1/Player".position
	var cursor_position = $ViewportContainer/Viewport/cursor.position
	
	
	if $"ViewportContainer/Viewport/Mapa 1/Player".max_speed > 0:
		var tween = get_node("Tween")
		
		tween.interpolate_property($ViewportContainer/Viewport/cursor, 
		"position",cursor_position, player_position, 0.1, Tween.TRANS_BACK, Tween.EASE_OUT)
		tween.start()

