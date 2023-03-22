extends Node2D
var textoBebida = "Você está bebado?! Assim vai acabar colocando a sua vida e a de outros em risco!!"
var textoSono = "Saiu de casa sem descansar?! Você sabia que essa é uma das principais causas de acidentes?!  "
var textoCelular = "Ei Saia do celular! Assim você vai perder o controle do caminhão!!"
var textoCarga = "Cuidado meu amigo!! O seu caminhão está sobrecarregado! Sua direção e freio Estão péssimos!!"
# Textos que apareceram dependendo de qual debif ele pegar

func _escolherInstrutor():
	
	if Global.rostoInstrutor == 'tonhao':
		$rosto.texture = load("res://Assets2/face/TonhaoBravo.png")
	elif Global.rostoInstrutor == 'seujorge':
		$rosto.texture = load("res://Assets2/face/SeuJorgeBravo.png")
	elif Global.rostoInstrutor == 'gina':
		$rosto.texture = load("res://Assets2/face/GinaBravo.png")
	elif Global.rostoInstrutor == 'nina':
		$rosto.texture = load("res://Assets2/face/NinaBrava.png")
		# Carrega a foto do instrutor escolhido
		
	if Global.nomeInstrutor == 'Tonhão':
		$instrutor.text = 'Tonhão'
	elif Global.nomeInstrutor == 'Seu Jorge':
		$instrutor.text = 'Seu Jorge'
	elif Global.nomeInstrutor == 'Gina':
		$instrutor.text ='Gina'
	elif Global.nomeInstrutor == 'Nina':
		$instrutor.text = 'Nina'
		# Carrega o nome do instrutor escolhido
	
	# Condições que identificam qual o instrutor escolhido e mudam o nome e a foto nos diálogos

func _interagirComDebuf():
	if Global.qualDebuf != "Nada":
		$Texto.visible_characters = 0
		
		$caixa.show()
		$instrutor.show()
		$Texto.show()
		$caixaPersonagem.show()
		$nomeIstritor.show()
		$rosto.show()
		
		# Faz com que quando algum debuf for pego os elementos do Diálogo apareçam na tela do jogador
		
		if Global.qualDebuf == "Bebida":
			$Texto.text = textoBebida
			$TimerLetras.start()
			$Timer.start()
			# Faz com que caso a bebida seja pega: O diálogo que aparece é o da bebida, além de sumir
			# com o diálogo depois de um certo tempo.
			
		elif Global.qualDebuf == "Sono":
			$Texto.text = textoSono
			$TimerLetras.start()
			$Timer.start()
			# Faz com que caso o sono seja pego: O diálogo que aparece é o do sono, além de sumir
			# com o diálogo depois de um certo tempo.
			
		elif Global.qualDebuf == "Celular":
			$Texto.text = textoCelular
			$TimerLetras.start()
			$Timer.start()
			# Faz com que caso o celular seja pego: O diálogo que aparece é o do celular, além de sumir
			# com o diálogo depois de um certo tempo.
			
		elif Global.qualDebuf == "Carga":
			$Texto.text = textoCarga
			$TimerLetras.start()
			$Timer.start()
			# Faz com que caso a carga pesada seja pega: O diálogo que aparece é o da carga pesada, além de sumir
			# com o diálogo depois de um certo tempo.
		
func _on_Timer_timeout():
	$caixa.hide()
	$instrutor.hide()
	$Texto.hide()
	$caixaPersonagem.hide()
	$nomeIstritor.hide()
	$rosto.hide()
	#faz com que quando o tempo termina, os elementos do dialogo desaparecem

func _on_TimerLetras_timeout():
	if $Texto.visible_characters != $Texto.text.length():
		$Texto.visible_characters += 1
	# Faz com que as letras apareceçam de pouquinho em pouquinho
	

func _ready():
	if Global.lingua == "eng":
		textoBebida = "Are you drinking?! You are putting people's lives in danger that way!!"
		textoSono = "Left home without resting?! Did you know that's one of the main accident causes?!"
		textoCelular = "Hey get off the phone! You'll lose the truck's control that way!!"
		textoCarga = "Careful my friend! Your truck is overloaded! Your brakes and turns are terrible!"
	elif Global.lingua == "esp":
		textoBebida = "Estás borracho?! Asi terminaras poniendo en riesgo tu vida y la de los demás!"
		textoSono = "Salir de casa sin descansar? Esta es una de las principales causas de accidentes!"
		textoCelular = "Oye bata tu telefono asi vas a perder el control del camion!!"
		textoCarga = "Cuidado  amigo!! Tu camion esta sobrecargado! Tu direccion y freno son terribles!!"
	_escolherInstrutor()
	$caixa.hide()
	$instrutor.hide()
	$Texto.hide()
	$caixaPersonagem.hide()
	$nomeIstritor.hide()
	$rosto.hide()
	# Começa o jogo com os elementos do diálogo escondidos

func _process(delta):
	_interagirComDebuf()




