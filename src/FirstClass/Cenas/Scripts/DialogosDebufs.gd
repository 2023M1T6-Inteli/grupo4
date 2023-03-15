extends Node2D
var textoBebida = "Você está bebado?! Assim vai acabar colocando a sua vida e a de outros em risco!!"
var textoSono = "Saiu de casa sem descansar?! Você sabia que essa é uma das principais causas de acidentes?!  "
var textoCelular = "Ei Saia do celular! Assim você vai perder o controle do caminhão!!"
var textoCarga = "Cuidado meu amigo!! O seu caminhão está sobrecarregado! Sua direção e freio Estão péssimos!!"
	
func _escolherInstrutor():
	
	if Global.rostoInstrutor == 'tonhao':
		$rosto.texture = load("res://Assets2/face/TonhaoBravo.png")
	elif Global.rostoInstrutor == 'seujorge':
		$rosto.texture = load("res://Assets2/face/SeuJorgeBravo.png")
	elif Global.rostoInstrutor == 'gina':
		$rosto.texture = load("res://Assets2/face/GinaBravo.png")
	elif Global.rostoInstrutor == 'nina':
		$rosto.texture = load("res://Assets2/face/NinaBrava.png")
		
	if Global.nomeInstrutor == 'Tonhão':
		$instrutor.text = 'Tonhão'
	elif Global.nomeInstrutor == 'Seu Jorge':
		$instrutor.text = 'Seu Jorge'
	elif Global.nomeInstrutor == 'Gina':
		$instrutor.text ='Gina'
	elif Global.nomeInstrutor == 'Nina':
		$instrutor.text = 'Nina'

func _interagirComDebuf():
	if Global.qualDebuf != "Nada":
		$Texto.visible_characters = 0
		
		$caixa.show()
		$instrutor.show()
		$Texto.show()
		$caixaPersonagem.show()
		$nomeIstritor.show()
		$rosto.show()
		
		if Global.qualDebuf == "Bebida":
			$Texto.text = textoBebida
			$TimerLetras.start()
			$Timer.start()
			
		elif Global.qualDebuf == "Sono":
			$Texto.text = textoSono
			$TimerLetras.start()
			$Timer.start()
			
		elif Global.qualDebuf == "Celular":
			$Texto.text = textoCelular
			$TimerLetras.start()
			$Timer.start()
			
		elif Global.qualDebuf == "Carga":
			$Texto.text = textoCarga
			$TimerLetras.start()
			$Timer.start()		
		
func _on_Timer_timeout():
	$caixa.hide()
	$instrutor.hide()
	$Texto.hide()
	$caixaPersonagem.hide()
	$nomeIstritor.hide()
	$rosto.hide()

func _on_TimerLetras_timeout():
	if $Texto.visible_characters != $Texto.text.length():
		$Texto.visible_characters += 1
	

func _ready():
	_escolherInstrutor()
	$caixa.hide()
	$instrutor.hide()
	$Texto.hide()
	$caixaPersonagem.hide()
	$nomeIstritor.hide()
	$rosto.hide()

func _process(delta):
	_interagirComDebuf()




