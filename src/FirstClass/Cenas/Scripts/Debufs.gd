extends Node2D

var randomNumber = RandomNumberGenerator.new()

func _ready():
	randomNumber.randomize()
	debuff_generator()

func debuff_generator():
	
	var debufs = randomNumber.randi_range(1, 4)
	# Função que gera número aleatórios e que de acondo com o número que foi selecionado
	# define qual será a penalidade encontrada na caixa pega pelo jogador
	
	if debufs == 1:
		$Bebida.show()
		$CargaPesada.hide()
		$Celular.hide()
		$Sono.hide()
		
		$Bebida/CollisionShape2D.set_deferred("disabled", false)
		$CargaPesada/CollisionShape2D.set_deferred("disabled", true)
		$Celular/CollisionShape2D.set_deferred("disabled", true)
		$Sono/CollisionShape2D.set_deferred("disabled", true)
		

		# Caso o número tenha sido o 1, a penalidade é a Bebida, portanto a condição de cima
		# fica responsável desabilitar os outros debuffs
		
	
	elif debufs == 2:
		$Bebida.hide()
		$CargaPesada.show()
		$Celular.hide()
		$Sono.hide()
		
		$Bebida/CollisionShape2D.set_deferred("disabled", true)
		$CargaPesada/CollisionShape2D.set_deferred("disabled", false)
		$Celular/CollisionShape2D.set_deferred("disabled", true)
		$Sono/CollisionShape2D.set_deferred("disabled", true)
		
		# Caso o número tenha sido o 2, a penalidade é a Carga pesada, portanto a condição de cima
		# fica responsável desabilitar os outros debuffs
	
	elif debufs == 3:
		$Bebida.hide()
		$CargaPesada.hide()
		$Celular.show()
		$Sono.hide()
		
		$Bebida/CollisionShape2D.set_deferred("disabled", true)
		$CargaPesada/CollisionShape2D.set_deferred("disabled", true)
		$Celular/CollisionShape2D.set_deferred("disabled", false)
		$Sono/CollisionShape2D.set_deferred("disabled", true)
		
		
		# Caso o número tenha sido o 3, a penalidade é o Celular, portanto a condição de cima
		# fica responsável desabilitar os outros debuffs
		
	elif debufs == 4:
		$Bebida.hide()
		$CargaPesada.hide()
		$Celular.hide()
		$Sono.show()
		
		$Bebida/CollisionShape2D.set_deferred("disabled", true)
		$CargaPesada/CollisionShape2D.set_deferred("disabled", true)
		$Celular/CollisionShape2D.set_deferred("disabled", true)
		$Sono/CollisionShape2D.set_deferred("disabled", false)
		
		# Caso o número tenha sido o 4, a penalidade é o Sono, portanto a condição de cima
		# fica responsável desabilitar os outros debuffs

func sumir(node):
	node.hide()
	$Particles2D.emitting = true
	yield(get_tree().create_timer(5.0), "timeout")
	debuff_generator()
	#Função que muda os debuffs depois de coletados

func _on_Bebida_body_entered(body):
	if body.name == "Player" or body.name == "Cacamba":
		if get_parent().get_parent().get_parent().material == preload("res://EfeitosTela/ShaderSono.tres"):
			sumir($Bebida)
		elif get_parent().get_parent().get_parent().get_parent().material == preload("res://EfeitosTela/ShaderBebida.tres"):
			sumir($Bebida)
		else:
			get_parent().get_parent().get_parent().material = load("res://EfeitosTela/ShaderBebida.tres")
			MusicController.debuff_bebida_sound()
			Global.qualDebuf = "Bebida"
			$TimerBebida.start()
			$TimerNecessario.start()
			sumir($Bebida)
	
	# Função responsável por aplicar o efeito espécial de Bebida a tela do jogador
	
func _on_Celular_body_entered(body):
	if body.name == "Player" or body.name == "Cacamba":
		Global.debuf = true
		Global.qualDebuf = "Celular"
		$TimerCelular.start()
		MusicController.debuff_celular_sound()
		$TimerNecessario.start()
		sumir($Celular)
	# Função responsável por aplicar as diferenças causadas pelo Celular ao jogador


func _on_Carga_Pesada_body_entered(body):
	if body.name == "Player" or body.name == "Cacamba":
		Global.debuf2 = true
		Global.qualDebuf = "Carga"
		MusicController.debuff_carga_pesada_sound()
		$TimerCarga.start()
		$TimerNecessario.start()
		sumir($CargaPesada)
	
	# Função responsável por aplicar as diferenças causadas pela Carga pesada ao jogador
	
func _on_Sono_body_entered(body):
	if body.name == "Player" or body.name == "Cacamba":
		if get_parent().get_parent().get_parent().material == preload("res://EfeitosTela/ShaderBebida.tres"):
			sumir($Sono)
		elif get_parent().get_parent().get_parent().material == preload("res://EfeitosTela/ShaderSono.tres"):
			sumir($Sono)
		else:
			get_parent().get_parent().get_parent().material = load("res://EfeitosTela/ShaderSono.tres")
			MusicController.debuff_sono_sound()
			Global.qualDebuf = "Sono"
			$TimerSono.start()
			$TimerNecessario.start()
			sumir($Sono)
		# Função responsável por aplicar o efeito espécial do sono a tela do jogador
	

func _on_TimerBebida_timeout():
	if get_parent().get_parent().get_parent().material == null:
		return
	else:
		get_parent().get_parent().get_parent().material = null
		MusicController.debuffs2_sound_off()
	


func _on_TimerSono_timeout():
	if get_parent().get_parent().get_parent().material == null:
		return
	else:
		get_parent().get_parent().get_parent().material = null
		MusicController.debuffs2_sound_off()

func _on_TimerCarga_timeout():
	Global.debuf2 = false
	MusicController.debuffs1_sound_off()

func _on_TimerCelular_timeout():
	Global.debuf = false
	MusicController.debuffs1_sound_off()
	
 # Funções responsáveis por retirar os efeitos dos Debufs após o tempo previamente determinado de 
 # duração de tais efeitos.

func _on_TimerNecessario_timeout():
	Global.qualDebuf = "Nada"
