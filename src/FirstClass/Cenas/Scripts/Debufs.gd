extends Node2D

var randomNumber = RandomNumberGenerator.new()

func _ready():
	randomNumber.randomize()
	var debufs = randomNumber.randi_range(1,4)
	
	# Função que gera número aleatórios e que de acondo com o número que foi selecionado
	# define qual será a penalidade encontrada na caixa pega pelo jogador
	
	if debufs == 1:
		$Bebida.visible = true
		$"Carga Pesada".visible = false
		$Celular.visible = false
		$Sono.visible = false
		
		$"Carga Pesada/CollisionShape2D".remove_and_skip()
		$Celular/CollisionShape2D.remove_and_skip()
		$Sono/CollisionShape2D.remove_and_skip()
	
		# Caso o número tenha sido o 1, a penalidade é a Bebida, por tanto a condição de cima
		# fica responsável por esconder as caixas com outros sprites sem ser a Bebida
		# e desabilitar a colisão das outras caixas também
		
	
	elif debufs == 2:
		$Bebida.visible = false
		$"Carga Pesada".visible = true
		$Celular.visible = false
		$Sono.visible = false
		
		$Bebida/CollisionShape2D.remove_and_skip()
		$Celular/CollisionShape2D.remove_and_skip()
		$Sono/CollisionShape2D.remove_and_skip()
		
		# Caso o número tenha sido o 2, a penalidade é a Carga pesada, por tanto 
		# a condição de cima fica responsável por esconder as caixas com outros sprites
		# sem ser a carga pesada e desabilitar a colisão das outras caixas também
	
	elif debufs == 3:
		$Bebida.visible = false
		$"Carga Pesada".visible = false
		$Celular.visible = true
		$Sono.visible = false
		
		$Bebida/CollisionShape2D.remove_and_skip()
		$"Carga Pesada/CollisionShape2D".remove_and_skip()
		$Sono/CollisionShape2D.remove_and_skip()
		
		# Caso o número tenha sido o 3, a penalidade é o celular, por tanto 
		# a condição de cima fica responsável por esconder as caixas com outros sprites
		# sem ser o celular e desabilitar a colisão das outras caixas também
		
	elif debufs == 4:
		$Bebida.visible = false
		$"Carga Pesada".visible = false
		$Celular.visible = false
		$Sono.visible = true
		
		$Bebida/CollisionShape2D.remove_and_skip()
		$"Carga Pesada/CollisionShape2D".remove_and_skip()
		$Celular/CollisionShape2D.remove_and_skip()
		
		# Caso o número tenha sido o 4, a penalidade é o sono, por tanto 
		# a condição de cima fica responsável por esconder as caixas com outros sprites
		# sem ser o sono pesada e desabilitar a colisão das outras caixas também

onready var timer = $Timer as Timer

func _on_Bebida_area_entered(area):
	get_parent().get_parent().get_parent().get_parent().material = preload("res://Efeitos tela/ShaderBebida.tres")
	timer.start()
	
	# Função responsável por aplicar o efeito espécial de Bebida a tela do jogador
	
func _on_Celular_area_entered(area):
	Global.debuf = true
	
	timer.set_wait_time(1.2)
	timer.start()
	
	# Função responsável por aplicar as diferenças causadas pelo Celular ao jogador


func _on_Carga_Pesada_area_entered(area):
	Global.debuf2 = true
	timer.set_wait_time(8)
	timer.start()
	
	# Função responsável por aplicar as diferenças causadas pela Carga pesada ao jogador
	
func _on_Sono_area_entered(area):
	get_parent().get_parent().get_parent().get_parent().material = preload("res://Efeitos tela/ShaderSono.tres")
	timer.start()
	
	# Função responsável por aplicar o efeito espécial do sono a tela do jogador
	

func _on_Timer_timeout() -> void:
	Global.debuf = false
	Global.debuf2 = false
	if get_parent().get_parent().get_parent().get_parent().material == null:
		return
	else:
		get_parent().get_parent().get_parent().get_parent().material = null
	
	#Função responsável reverter as mudanças aplicados ao jogador após o tempo de efeito dos Debufs
