extends Control

func _ready():
	$"ViewportContainer/Viewport/Mapa 1/Player/Camera2D".zoom = Vector2(70,90)
	# Comando responsável por pegar a camera do Player e dar um zoom inverso, para que seja possível
	# ver o mapa inteiro dentro no minimapa


func _physics_process(delta):
	var playerPosition = $"ViewportContainer/Viewport/Mapa 1/Player".position
	var cursorPosition = $ViewportContainer/Viewport/cursor.position
	
	if $"ViewportContainer/Viewport/Mapa 1/Player".maxSpeed > 0:
		var tween = get_node("Tween")
		
		tween.interpolate_property($ViewportContainer/Viewport/cursor, 
		"position",cursorPosition, playerPosition, 0.1, Tween.TRANS_BACK, Tween.EASE_OUT)
		tween.start()
	#Comando que faz a bolinha vermelha no minimapa, seguir o pesonagem pricipal e assim ser possível
	# saber onde o caminhão esta no mapa.
	
	$ViewportContainer.material = null
