extends Node2D

var hover = 0
#guarda o valor que define se o efeito sonoro de hover deve tocar ou não

func _ready():
	Global.debuf = false
	Global.debuf2 = false
	#garantindo que os debuffs são reiniciados
	
func som_hover():
	if hover == 0:
		$SomHover.play()

func _on_menu_pressed():
	#alterando texturas dos botões para não serem interativas após um ser pressionado
	$menu.texture_normal = $menu.texture_hover
	$restart.texture_hover = null
	hover = 1
	if !$SomConfirmar.playing:
		$SomConfirmar.play()
		yield(get_tree().create_timer(0.25), "timeout")
		get_tree().change_scene("res://Cenas/menu.tscn")
	#mudança de cena e efeito sonoro
	
func _on_restart_pressed():
	#alterando texturas dos botões para não serem interativas após um ser pressionado
	$restart.texture_normal = $restart.texture_hover
	$menu.texture_hover = null
	hover = 1
	if !$SomConfirmar.playing:
		$SomConfirmar.play()
		yield(get_tree().create_timer(0.25), "timeout")
		get_tree().change_scene("res://Cenas/Game.tscn")
#mudança de cena e efeito sonoro

func _on_restart_mouse_entered():
	som_hover()

func _on_menu_mouse_entered():
	som_hover()
