extends Node

onready var loading_scene = preload("res://Cenas/LoadingScreen.tscn")

func load_scene(current_scene, next_scene):
	#parando a música
	MusicController.stop_music()
	
	#adicionando a cena de carregamento 
	var loading_scene_instance = loading_scene.instance()
	get_tree().get_root().call_deferred("add_child", loading_scene_instance)
	
	var texto = loading_scene_instance.get_node("Label")
	if Global.lingua == "eng":
		texto.text = "Loading..."
	if Global.lingua == "esp":
		texto.text = "Cargando..."
	#carregando a cena desejada
	var loader = ResourceLoader.load_interactive(next_scene)
	
	#saindo da cena atual
	current_scene.queue_free()
	
	#tempo de transição de cena
	yield(get_tree().create_timer(0.5), "timeout")
	
	#criando loop "infinito" pois a função "poll" carrega dados em blocos e precisa estar num loop para carregar todos
	while true:
		#carregando dados
		var error = loader.poll()
		
		#caso não ocorra erro
		if error == OK:
			
			#atualize o valor da barra de progresso de acordo com o conteúdo carregado
			var progress_bar = loading_scene_instance.get_node("ProgressBar")
			progress_bar.value = float(loader.get_stage())/loader.get_stage_count() * 100
		
		#erro emitido quando o conteúdo é totalmente carregado e a função é executada mesmo assim
		elif error == ERR_FILE_EOF:
			
			#instanciando a cena carregada
			var scene = loader.get_resource().instance()
			
			#adicionando a cena carregada
			get_tree().get_root().call_deferred("add_child", scene)
			
			#retirando a cena da tela de carregamento
			loading_scene_instance.queue_free()
			
			#acabando com o loop
			return
