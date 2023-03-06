extends NinePatchRect

var instrutor = "nina"

#referência para o RichTextLabel
onready var text := $RichTextLabel
#referência para o tempo
onready var timer := $Timer	
#guarda a fila de mensagens que será exibida

var cont = 0

var msg_queue: Array = [
	"Olá, " + Global.nome + "!" + " Eu sou o " + instrutor + ", seu instrutor nessa jornada.",
	"Trabalho com transporte de carga química há 10 anos e vou te ajudar a seguir seu percurso com segurança."
]
	
#ao dar enter no teclado é mostrado o próximo elemento da fila de mensagens
func _input(event):
	if event is InputEventKey and event.is_action_pressed("ui_accept") and cont < len(msg_queue):
		show_menssage() #comando para mostrar a mensagem
		cont += 1
	else:
		get_tree().change_scene("res://Cena/Game.tscn")

func show_menssage() -> void:
	if not timer.is_stopped(): 
		text.visible_characters = text.bbcode_text.length()
		return
		
	if msg_queue.size() == 0: #quando o tamanho da mensagem é 0, a fila de mensagens acaba
		return
	
	var _msg: String = msg_queue.pop_front() #remove o primeiro elemento e retorna o valor dele
	
	#mostra uma letra de cada vez
	text.visible_characters = 0
	text.bbcode_text =  _msg #altera o texto
	timer.start() #inicia o tempo

#função para ao clicar enter a mensagem se completa, sem precisar esperar o tempo
func _on_Timer_timeout():
	if text.visible_characters == text.bbcode_text.length():
		timer.stop()
	text.visible_characters += 1
