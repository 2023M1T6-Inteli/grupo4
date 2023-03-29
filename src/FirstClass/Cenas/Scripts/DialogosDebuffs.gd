extends Node2D
var textoBebida = "Não beba enquanto dirige! Seus reflexos e coordenação pioram quando embriagado."
var textoSono = "Você não está com muito sono? É melhor não continuar dirigindo dessa forma."
var textoCelular = "Não fique no celular enquanto dirige! Olhos sempre na estrada!"
var textoCarga = "Cuidado meu amigo! O seu caminhão está sobrecarregado! Sua direção e freio estão péssimos!"
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
		textoBebida = "Don't drink while you drive! Your reflexes become worse when you're drunk."
		textoSono = "Aren't you too tired? It's better that you stop driving and take a rest."
		textoCelular = "Don't be on your cellphone while you drive! Keep your eyes on the road!"
		textoCarga = "Be careful my friend! Your truck is overloaded! Your driving and turns are terrible!"
	elif Global.lingua == "esp":
		textoBebida = "Não beba enquanto dirige! Seus reflexos e coordenação pioram quando embriagado."
		textoSono = "Você não está com muito sono? É melhor não continuar dirigindo dessa forma."
		textoCelular = "Não fique no celular enquanto dirige! Olhos sempre na estrada!"
		textoCarga = "Cuidado meu amigo! O seu caminhão está sobrecarregado! Sua direção e freio estão péssimos!"
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




