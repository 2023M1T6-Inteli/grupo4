extends Node2D

var randomNumber = RandomNumberGenerator.new()

func _ready():
	
	randomNumber.randomize()
	var debufs = randomNumber.randi_range(1, 4)
	# Função que gera número aleatórios e que de acondo com o número que foi selecionado
	# define qual será a penalidade encontrada na caixa pega pelo jogador
	
	if debufs == 1:
		$Celular.queue_free()
		$"Carga Pesada".queue_free()
		$Sono.queue_free()

		# Caso o número tenha sido o 1, a penalidade é a Bebida, portanto a condição de cima
		# fica responsável desabilitar os outros debuffs
		
	
	elif debufs == 2:
		$Bebida.queue_free()
		$Celular.queue_free()
		$Sono.queue_free()

		# Caso o número tenha sido o 2, a penalidade é a Carga pesada, portanto a condição de cima
		# fica responsável desabilitar os outros debuffs
	
	elif debufs == 3:
		$Bebida.queue_free()
		$"Carga Pesada".queue_free()
		$Sono.queue_free()
		
		# Caso o número tenha sido o 3, a penalidade é o Celular, portanto a condição de cima
		# fica responsável desabilitar os outros debuffs
		
	elif debufs == 4:
		$Bebida.queue_free()
		$"Carga Pesada".queue_free()
		$Celular.queue_free()
		
		# Caso o número tenha sido o 4, a penalidade é o Sono, portanto a condição de cima
		# fica responsável desabilitar os outros debuffs


func _on_Bebida_area_entered(area):
	if get_parent().get_parent().get_parent().material == preload("res://Efeitos tela/ShaderSono.tres"):
		pass
	elif get_parent().get_parent().get_parent().material == preload("res://Efeitos tela/ShaderBebida.tres"):
		pass
	else:
		get_parent().get_parent().get_parent().material = load("res://Efeitos tela/ShaderBebida.tres")
		$TimerBebida.start()
	
	# Função responsável por aplicar o efeito espécial de Bebida a tela do jogador
	
func _on_Celular_area_entered(area):
	Global.debuf = true
	$TimerCelular.start()

	# Função responsável por aplicar as diferenças causadas pelo Celular ao jogador


func _on_Carga_Pesada_area_entered(area):
	Global.debuf2 = true
	$TimerCarga.start()

	
	# Função responsável por aplicar as diferenças causadas pela Carga pesada ao jogador
	
func _on_Sono_area_entered(area):
	if get_parent().get_parent().get_parent().material == preload("res://Efeitos tela/ShaderBebida.tres"):
		pass
	elif get_parent().get_parent().get_parent().material == preload("res://Efeitos tela/ShaderSono.tres"):
		pass
	else:
		get_parent().get_parent().get_parent().material = load("res://Efeitos tela/ShaderSono.tres")
		$TimerSono.start()
	# Função responsável por aplicar o efeito espécial do sono a tela do jogador
	

func _on_TimerBebida_timeout():
	if get_parent().get_parent().get_parent().material == null:
		return
	else:
		get_parent().get_parent().get_parent().material = null
	


func _on_TimerSono_timeout():
	if get_parent().get_parent().get_parent().material == null:
		return
	else:
		get_parent().get_parent().get_parent().material = null


func _on_TimerCarga_timeout():
	Global.debuf2 = false


func _on_TimerCelular_timeout():
	Global.debuf = false
