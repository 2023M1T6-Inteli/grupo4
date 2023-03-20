extends Node2D
var alfabeto = [] #variável que ajudará a verificar se o jogador inseriu texto no LineEdit
var caracteres_latinos = ["Ã", "Õ", "Ñ", "Á", "É", "Í", "Ó", "Ú", "Â", "Ê", "Ô", "Ç", "ã", "õ","ñ", "á", "é", "í", "ó", "ú", "â", "ê", "ô", "ç"]
var hover = 0
#guarda o valor que define se o efeito sonoro de hover deve tocar ou não
func _ready():
	if Global.lingua == "eng": #tradução
		$DIGITE.text = "Type your name"
		$LineEdit.placeholder_text = "Type here"
	if Global.lingua == "esp": #tradução
		$DIGITE.text = "Escriba su nombre"
		$LineEdit.placeholder_text = "Escriba aqui"
	for i in range(26):
		alfabeto.append(char(ord("A")+ i))
	for i in range(26):
		alfabeto.append(char(ord("a") + i))
	alfabeto.append_array(caracteres_latinos)
	$LineEdit.max_length = 20
func som_hover():
	if hover == 0:
		$SomHover.play()
func confirmar():
	hover = 1
	if !$SomConfirmar.playing:
		$SomConfirmar.play()
		yield(get_tree().create_timer(0.45), "timeout")
		get_tree().change_scene("res://Cenas/instrutores.tscn")
		#mudança para a tela de instrutores e efeito sonoro
#mudança de tela para prosseguir
func _on_BotaoOk_pressed():
	var texto = $LineEdit.text
	for letter in alfabeto:
		if texto.count(" ", 0, texto.find(letter)) > 0:
			texto.erase(0, texto.find(letter))
	#garantindo que algum texto será inserido para prosseguir
	for letter in alfabeto:
		if letter in texto:
			Global.nome = texto
			confirmar()
		else:
			pass
#mudança de tela para voltar
func _on_BotaoVoltar_pressed():
	if !$SomVoltar.playing:
		$SomVoltar.play()
		yield(get_tree().create_timer(0.35), "timeout")
		get_tree().change_scene("res://Cenas/menu.tscn")
		#mudança para a tela de menu e efeito sonoro
#permitindo o avanço para outra cena utilizando a tecla "Enter" também
func _on_LineEdit_text_entered(new_text):
	#garantindo que algum texto será inserido para prosseguir
	for letter in alfabeto:
		if new_text.count(" ", 0, new_text.find(letter)) > 0:
			new_text.erase(0, new_text.find(letter))
	for letter in alfabeto:
		if letter in new_text:
			Global.nome = new_text
			confirmar()
		else:
			pass
func _on_BotaoOk_mouse_entered():
	som_hover()
func _on_BotaoVoltar_mouse_entered():
	som_hover()
