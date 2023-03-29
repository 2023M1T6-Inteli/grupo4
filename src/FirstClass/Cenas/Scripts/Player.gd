extends KinematicBody2D # Herda as características da classe KinematicBody2D.

var angularSpeed = PI / 2 # Variável que guarda o valor da velocidade de rotação do objeto (afeta as curvas).

var maxSpeed : float # Variável que guarda o valor da velocidade máxima ou limite do deslocamento do objeto.

var acceleration = 10 # Variável que guarda o valor da velocidade de aceleração do deslocamento do objeto.

var velocity = Vector2.ZERO # Variável de velocidade do objeto em relação aos vetores nos eixos x e y.

var friction = 5.0  # Variável que guarda o valor da fricção do objeto com o chão (afeta a freagem).

func _physics_process(delta): # Nessa função declaro as verificações executadas a cada frame pelo programa.
	if Global.dificuldade == "Dificil":
		$Area2D2.gravity_distance_scale = 0.5
	sounds() # executa a função "sounds"
	
	var directionX = 0 # Variável que guarda o valor da direção de rotação do objeto (1 = direita; -1 = esquerda;
	# 0 = sem rotação).
	
	var directionY = 1 # Variável que guarda o valor da direção do objeto (1 = para cima; 
	#-1 = para baixo)

		
	if Input.is_action_pressed("ui_right") and velocity == Vector2.ZERO:
		directionX = 0
			
	if Input.is_action_pressed("ui_left") and velocity == Vector2.ZERO:
		directionX = 0
	# As duas condicionais acima impedem que o objeto possa rotacionar parado, pois veículos não fazem curvas parados.
	
	if Input.is_action_pressed("ui_right") and velocity != Vector2.ZERO and Global.debuf == false:
		directionX = 1
		rotation += angularSpeed * directionX * delta
		
	if Input.is_action_pressed("ui_left") and velocity != Vector2.ZERO and Global.debuf == false:
		directionX = -1
		rotation += angularSpeed * directionX * delta
	
	#print("debuf externo",debuf)
		
	# As duas condicionais acima determinam que, se o objeto está em movimento, ele pode rotacionar de acordo
	# com a tecla pressionada.
	
	if Input.is_action_pressed("ui_down"):
		directionY = -1
		maxSpeed = 70
		velocity += Vector2.UP.rotated(rotation) * (acceleration * directionY)
		velocity = velocity.clamped(maxSpeed)
	else:
		directionY = 1
		if Global.dificuldade == "Facil":
			maxSpeed = 80
		elif Global.dificuldade == "Medio":
			maxSpeed = 120
		elif Global.dificuldade == "Dificil":
			maxSpeed = 170
	#Define a velocidade máxima em função da dificuldade
	
	# As duas condicionais acima determinam que, se o jogador precionar a setinha para baixo,
	# o caminhão inverterá seu movimento, começando a andar para trás (Dando ré), e que
	# se o botão deixar de ser precionado o caminhãovolta ao movimento normal.
	
	if Input.is_action_pressed("ui_up"):
		if !Input.is_action_pressed("ui_down"):
			velocity += Vector2.UP.rotated(rotation) * (acceleration * directionY)
			velocity = velocity.clamped(maxSpeed)
			Global.points += 1
			
	# A condicional acima determina que o objeto ganha velocidade de deslocamento quando a seta para cima
	# é pressionada, que a velocidade não pode ultrapassar o valor guardado na variável "max_speed" e aumenta a pontuação
		
		if Global.debuf2 == true:
			angularSpeed = PI/5
		else:
			angularSpeed = PI/2
		# As condicionais a cima alteram a capacidade de fazer curva do caminhão quando o Debuf de carga
		# é pego, dificultando assim tal processo quando o carro esta em movimento
			
		

	else:
		if Global.debuf == true:
			friction = 0	
		elif Global.debuf2 == true:
			friction = 1.5
			angularSpeed = PI/5.2
		else:
			friction = 7
			angularSpeed = PI/3.2
			# As condições acima levaram a mudançã de jogabilidade quando o jogador inicia a frenagem e pega
			# os Debufs de carga e o celular, essas condições alteram a frenagem do caminhão e a capacidade 
			#de fazer curvas, dificulcando assim o trajeto a ser percorrido
			
		velocity = velocity.move_toward(Vector2.ZERO, friction) 
		
	# A condicional acima determina que, quando a tecla "espaço" não é pressionada, o objeto perde velocidade
	# gradativamente de acordo com o valor armazenado na variável "friction", como uma freagem. Além disso, a
	# velocidade de rotação do objeto é diminuída enquanto ocorre essa freagem. 


	var collide = move_and_collide(velocity * delta)
	# Método que controla o movimento do objeto de acordo com vetores e identifica quando o player
	# sofre alguma colisão.
	if collide:
		lose()


#função que controla efeitos sonoros, visuais e de jogabilidade que ocorrem quando o player colide com o cenário
func lose():
	Global.debuf = false
	Global.debuf2 = false
	get_parent().get_node("Cacamba").get_node("Explosao").emitting = true
	self.modulate = "413a3a"
	get_parent().get_node("Cacamba").get_node("AnimatedSprite").modulate = "413a3a"
	$SomIdle.stop()
	$SomRe.stop()
	set_physics_process(false)
	get_parent().get_node("Cacamba").get_node("ExplosaoSFX").play()
	MusicController.stop_music()
	MusicController.debuffs1_sound_off()
	MusicController.debuffs2_sound_off()


func sounds(): # função que controla os sons relativos ao jogador e sua movimentação
	if !$SomIdle.playing:
		$SomIdle.play()

	if Input.is_action_just_pressed("ui_up"):
		$SomAcelerando.play("acelerar")
	if Input.is_action_just_released("ui_up") and Global.debuf2 == false:
		$SomAcelerando.play("acelerar", -1, -2.5, true)
	elif Input.is_action_just_released("ui_up") and Global.debuf2 == true:
		$SomAcelerando.play("acelerar", -1, -1, true)
	if Input.is_action_just_pressed("ui_down"):
		$SomRe.play()
	if Input.is_action_just_released("ui_down"):
		$SomRe.stop()
	else:
		pass
