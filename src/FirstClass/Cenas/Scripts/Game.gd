extends Node2D

func _ready():
	Global.pausado = 0
	$CanvasLayer/Pause.hide()
	
	if Global.mapa == 1: #selecionando o Mapa 1 (Floresta)
		$ViewportContainer/Viewport/Mapa1/Player/Camera2D.current = true
		$ViewportContainer/Viewport/Mapa2/Player/Camera2D.current = false
		$ViewportContainer/Viewport/Mapa2.queue_free()
		$ViewportContainer/Viewport/DebufsMapa2.queue_free()
		
		
		
	if Global.mapa == 2: #selecionando o Mapa 2 (Velho Oeste)
		$ViewportContainer/Viewport/Mapa2/Player/Camera2D.current = true
		$ViewportContainer/Viewport/Mapa1/Player/Camera2D.current = false
		$ViewportContainer/Viewport/Mapa1.queue_free()
		$ViewportContainer/Viewport/DebufsMapa1.queue_free()

func _process(delta):
	if Input.is_action_just_pressed("esc"):
		$CanvasLayer/Pause.show()
		Global.pausado = 1
		Engine.time_scale = 0.001

func _on_BotaoContinuar_pressed():
	if Global.pausado == 0:
		print("Cheetos")
		pass
	elif Global.pausado == 1:
		print("opa")
		Engine.time_scale = 1
		$CanvasLayer/Pause.hide()
		Global.pausado = 0



func _on_BotaoRecomecar_pressed():
	Engine.time_scale = 1
	get_tree().change_scene("res://Cenas/Antibug.tscn")


func _on_BotaoMenu_pressed():
	Engine.time_scale = 1
	get_tree().change_scene("res://Cenas/Menu.tscn")
