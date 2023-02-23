extends KinematicBody2D # Herda as características da classe KinematicBody2D.


var angularSpeed = PI / 2 # Variável que guarda o valor da velocidade de rotação do objeto (afeta as curvas).

var maxSpeed = 150.0 # Variável que guarda o valor da velocidade máxima ou limite do deslocamento do objeto.

var acceleration = 10 # Variável que guarda o valor da velocidade de aceleração do deslocamento do objeto.

var velocity = Vector2.ZERO # Variável de velocidade do objeto em relação aos vetores nos eixos x e y.

var friction = 7.0  # Variável que guarda o valor da fricção do objeto com o chão (afeta a freagem).

func _physics_process(delta): # Nessa função declaro as verificações executadas a cada frame pelo programa.
	
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
	else:
		directionY = 1
		maxSpeed = 150
	
	# As duas condicionais acima determinam que, se o jogador precionar a setinha para baixo,
	# o caminhão inverterá seu movimento, começando a andar para trás (Dando ré), e que
	# se o botão deixar de ser precionado o caminhãovolta ao movimento normal.
	
	if Input.is_action_pressed("spacebar"):
		velocity += Vector2.UP.rotated(rotation) * (acceleration * directionY)
		velocity = velocity.clamped(maxSpeed)
	
	# A condicional acima determina que o objeto ganha velocidade de deslocamento quando a tecla "espaço"
	# é pressionada, que a velocidade não pode ultrapassar o valor guardado na variável "max_speed" e que a
	# velocidade de rotação do objeto enquanto ele acelera é igual à armazenada no topo do código.
		
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

	if collide: 
		Global.debuf2 = false
		Global.debuf = false
		get_tree().change_scene("res://Cenas/Tela_Gameover.tscn")
		
	# Método que controla o movimento do objeto de acordo com vetores e identifica quando o player
	# sofre alguma colisão.

