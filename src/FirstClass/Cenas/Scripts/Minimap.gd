extends Control

func _ready():
	$SubViewportContainer/SubViewport/Mapa1/Player/Camera2D.zoom = Vector2(70,90)
	# Comando responsável por pegar a camera do Player e dar um zoom inverso, para que seja possível
	# ver o mapa inteiro dentro no minimapa


func _physics_process(delta):
	var playerPosition = $SubViewportContainer/SubViewport/Mapa1/Player.position 
	var cursorPosition = $SubViewportContainer/SubViewport/cursor.position
	
	if $SubViewportContainer/SubViewport/Mapa1/Player.maxSpeed > 0:
		var tween = get_node("Tween")
		
		tween.interpolate_property($SubViewportContainer/SubViewport/cursor, 
		"position",cursorPosition, playerPosition, 0.1, Tween.TRANS_BACK, Tween.EASE_OUT)
		tween.start()
	
	$SubViewportContainer/SubViewport/cursor/CollisionShape2D.set_disabled(true)
	#Comando que faz a bolinha vermelha no minimapa, seguir o pesonagem pricipal e assim ser possível
	# saber onde o caminhão esta no mapa.
	
	$SubViewportContainer.material = null
	# Não permite que a tela do minimpa também tenha os efeitos causados pelos debufs
