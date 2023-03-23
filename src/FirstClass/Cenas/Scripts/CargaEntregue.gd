extends Node2D

var cont = 0

func _ready():
	self.hide() #escondendo a mensagem por padrão
	
func _process(delta):
	if self.visible == true:
		tocar_som()
		yield(get_tree().create_timer(3.5), "timeout") #mostrando e escondendo a mensagem logo em seguida (com efeito sonoro)
		cont = 0
		self.hide()
		
func tocar_som():
	if cont == 0:
		$AudioCarga.play()
		cont +=1
