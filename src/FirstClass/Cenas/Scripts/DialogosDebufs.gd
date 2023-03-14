extends Node2D


func _escolherInstrutor():
	
	if Global.rostoInstrutor == 'tonhao':
		$rosto.texture = load("res://Assets2/face/TonhaoSorrindo.png")
	elif Global.rostoInstrutor == 'seujorge':
		$rosto.texture = load("res://Assets2/face/SeuJorgeSorrindo.png")
	elif Global.rostoInstrutor == 'gina':
		$rosto.texture = load("res://Assets2/face/GinaSorrindo.png")
	elif Global.rostoInstrutor == 'nina':
		$rosto.texture = load("res://Assets2/face/NinaSorrindo.png")
		
	if Global.nomeInstrutor == 'Tonhão':
		$instrutor.text = 'Tonhão'
	elif Global.nomeInstrutor == 'Seu Jorge':
		$instrutor.text = 'Seu Jorge'
	elif Global.nomeInstrutor == 'Gina':
		$instrutor.text ='Gina'
	elif Global.nomeInstrutor == 'Nina':
		$instrutor.text = 'Nina'

func _interagirComDebuf():
	pass
func _ready():
	_escolherInstrutor()
	$caixa.hide()
	$Label.hide()
	$Texto.hide()
	$caixaPersonagem.hide()
	$nomeIstritor.hide()
	$rosto.hide()

