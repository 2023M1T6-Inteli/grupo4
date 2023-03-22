extends Control

func _ready():
	if Global.mapa == 1:
		$ViewportContainer/Viewport/Mapa1/Player/Camera2D.current = true
		$ViewportContainer/Viewport/Mapa2/Player/Camera2D.current = false
		$ViewportContainer/Viewport/Mapa2.queue_free()
		$ViewportContainer/Viewport/Mapa1/Player/Camera2D.zoom = Vector2(70,90)
		
	if Global.mapa == 2:
		$ViewportContainer/Viewport/Mapa2/Player/Camera2D.current = true
		$ViewportContainer/Viewport/Mapa1/Player/Camera2D.current = false
		$ViewportContainer/Viewport/Mapa1.queue_free()
		$ViewportContainer/Viewport/Mapa2/Player/Camera2D.zoom = Vector2(90,120)
		
	# Comando responsável por pegar a camera do Player e dar um zoom inverso, para que seja possível
	# ver o mapa inteiro dentro no minimapa


func _physics_process(delta):
	if Global.mapa == 1:
		var playerPosition = $ViewportContainer/Viewport/Mapa1/Player.position 
		var cursorPosition = $ViewportContainer/Viewport/cursor.position
		
		if $ViewportContainer/Viewport/Mapa1/Player.maxSpeed > 0:
			var tween = get_node("Tween")
			
			tween.interpolate_property($ViewportContainer/Viewport/cursor, 
			"position",cursorPosition, playerPosition, 0.1, Tween.TRANS_BACK, Tween.EASE_OUT)
			tween.start()
	
	if Global.mapa == 2:
		var playerPosition = $ViewportContainer/Viewport/Mapa2/Player.position 
		var cursorPosition = $ViewportContainer/Viewport/cursor.position
		
		if $ViewportContainer/Viewport/Mapa2/Player.maxSpeed > 0:
			var tween = get_node("Tween")
			
			tween.interpolate_property($ViewportContainer/Viewport/cursor, 
			"position",cursorPosition, playerPosition, 0.1, Tween.TRANS_BACK, Tween.EASE_OUT)
			tween.start()

	
	$ViewportContainer/Viewport/cursor/CollisionShape2D.set_disabled(true)
	#Comando que faz a bolinha vermelha no minimapa, seguir o pesonagem pricipal e assim ser possível
	# saber onde o caminhão esta no mapa.
	
	$ViewportContainer.material = null
	# Não permite que a tela do minimpa também tenha os efeitos causados pelos debufs
