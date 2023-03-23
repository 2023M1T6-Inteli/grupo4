extends Node2D

var hover = 0

func _ready(): #botando traduções
	if Global.lingua == "eng":
		$Dificuldade.text = "Difficulty"
		$ldfacil.text = "Easy"
		$lddificil.text = "Hard"
		$ldmedio.text = "Medium"
	
	if Global.lingua == "esp":
		$Dificuldade.text = "Dificultad"
		$ldmedio.text = "Normal"

func som_hover():
	if hover == 0:
		$SomHover.play()

func confirmar():
	$Transicao/fill/AnimationPlayer.play("Fora")
	hover = 1
	if !$SomConfirmar.playing:
		$SomConfirmar.play()
		yield(get_tree().create_timer(0.5), "timeout")
		get_tree().change_scene("res://Cenas/Mapas.tscn")
		
func _on_Botaofacil_pressed():
	Global.dificuldade = "Facil"
	hover = 1
	confirmar()

func _on_Botaomedio_pressed():
	Global.dificuldade = "Medio"
	hover = 1
	confirmar()


func _on_Botaodificil_pressed():
	Global.dificuldade = "Dificil"
	hover = 1
	confirmar()

#Os botões salvam a dificuldade em uma variavel global

func _on_BotaoVoltar_pressed():
	hover = 1
	if !$SomVoltar.playing:
		$SomVoltar.play()
		yield(get_tree().create_timer(0.5), "timeout")
		get_tree().change_scene("res://Cenas/Caminhoes.tscn")


func _on_Botaofacil_mouse_entered():
	som_hover()

func _on_Botaomedio_mouse_entered():
	som_hover()

func _on_Botaodificil_mouse_entered():
	som_hover()

func _on_BotaoVoltar_mouse_entered():
	som_hover()
