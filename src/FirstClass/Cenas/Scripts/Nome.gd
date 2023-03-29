extends Node2D

var alfabeto = [] #variável que ajudará a verificar se o jogador inseriu texto no LineEdit
var caracteres_latinos = ["Ã", "Õ", "Ñ", "Á", "É", "Í", "Ó", "Ú", "Â", "Ê", "Ô", "Ç", "ã", "õ","ñ", "á", "é", "í", "ó", "ú", "â", "ê", "ô", "ç"]
var hover = 0

#guarda o valor que define se o efeito sonoro de hover deve tocar ou não
func _ready():
	if Global.lingua == "eng": #tradução
		$Digite.text = "Type your name"
		$LineEdit.placeholder_text = "Type here"
	if Global.lingua == "esp": #tradução
		$Digite.text = "Escriba su nombre"
		$LineEdit.placeholder_text = "Escriba aqui"

	#criando uma lista com caracteres do alfabeto para verificações futuras
	for i in range(26):
		alfabeto.append(char(ord("A")+ i))
	for i in range(26):
		alfabeto.append(char(ord("a") + i))
	alfabeto.append_array(caracteres_latinos) #incluindo caracteres latinos na lista

	$LineEdit.max_length = 25


#função de efeito sonoro
func som_hover():
	if hover == 0:
		$SomHover.play()


func confirmar():
	hover = 1
	if !$SomConfirmar.playing:
		$SomConfirmar.play()
		$Transicao/fill/AnimationPlayer.play("Fora")
		yield(get_tree().create_timer(0.45), "timeout")
		get_tree().change_scene("res://Cenas/Instrutores.tscn")
		#mudança para a tela de instrutores e efeito sonoro


#mudança de tela para prosseguir
func _on_BotaoOk_pressed():

	var texto = $LineEdit.text
	texto = texto.lstrip(" ")
	texto = texto.rstrip(" ")
	#garantindo que algum texto será inserido para prosseguir e não haverão espaços nas extremidades
	for letter in alfabeto:
		if letter in texto:
			Global.nome = texto
			confirmar()
		else:
			pass


#mudança de tela para voltar
func _on_BotaoVoltar_pressed():
	$Transicao/fill/AnimationPlayer.play("Fora")
	if !$SomVoltar.playing:
		$SomVoltar.play()
		yield(get_tree().create_timer(0.35), "timeout")
		get_tree().change_scene("res://Cenas/Menu.tscn")
		#mudança para a tela de menu e efeito sonoro


#permitindo o avanço para outra cena utilizando a tecla "Enter" também
func _on_LineEdit_text_entered(new_text):
	#garantindo que algum texto será inserido para prosseguir e não haverão espaços nas extremidades
	new_text = new_text.lstrip(" ")
	new_text = new_text.rstrip(" ")
	for letter in alfabeto:
		if letter in new_text:
			Global.nome = new_text
			#Global.nomes_ranking.append(Global.nome)
			confirmar()
		else:
			pass

#funções de efeito sonoro
func _on_BotaoOk_mouse_entered():
	som_hover()
func _on_BotaoVoltar_mouse_entered():
	som_hover()
