extends Node2D

func _ready():
	self.hide() #escondendo a mensagem por padrão
	
func _process(delta):
	if self.visible == true:
		yield(get_tree().create_timer(3.5), "timeout") #mostrando e escondendo a mensagem logo em seguida (com efeito sonoro)
		self.hide()
