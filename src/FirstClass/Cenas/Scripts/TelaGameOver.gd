extends Node2D

var hover = 0
#guarda o valor que define se o efeito sonoro de hover deve tocar ou não

var podeAtualizar = true #permite a atualização do ranking

func _ready():

	Global.debuf = false
	Global.debuf2 = false
	Global.permissao = false
	#garantindo que os debuffs, a gasolina e a variável "permissao" são reiniciados
	
	if Global.dificuldade == "Facil":
		Global.gasolina = 115.0
		
	if Global.dificuldade == "Medio":
		Global.gasolina = 105.0
		
	if Global.dificuldade == "Dificil":
		Global.gasolina = 90.0
	#definindo o tempo para finalizar a gasolina em função da dificuldade
	
	$Pontos.text = "Parabéns " + str(Global.nome) + ", você fez " + str(Global.points / 12) + " reais!"
	#mostrando os pontos com uma mensagem
	
	if Global.lingua == "eng":
		$OVER.text = "GAME OVER"
		$RESTART.text = "Restart"
		$TextoCreditos.text = "Credits"
		$Pontos.text = "Congratulations " + str(Global.nome) + ", you made " + str(Global.points/12)+" dollars!"
	
	if Global.lingua == "esp":
		$OVER.text = "FIN DEL JUEGO"
		$RESTART.text = "Reanudar"
		$TextoCreditos.text = "Creditos"
		$Pontos.text = "Felicitaciones " + str(Global.nome) + ", has conseguido " + str(Global.points/12)+ " pesos!"
	#traduções
	
	MusicController.debuffs1_sound_off()
	MusicController.debuffs2_sound_off()
	MusicController.play_game_over_music()
	#tocando a música certa
	
func som_hover():
	if hover == 0:
		$SomHover.play()

func _on_menu_pressed():
	$Transicao/fill/AnimationPlayer.play("Fora")
	#alterando texturas dos botões para não serem interativas após um ser pressionado
	$menu.texture_normal = $menu.texture_hover
	$restart.texture_hover = null
	$Creditos.texture_hover = null
	
	#reiniciando a pontuação
	Global.points = 0
	
	hover = 1
	if !$SomConfirmar.playing:
		$SomConfirmar.play()
		yield(get_tree().create_timer(0.25), "timeout")
		podeAtualizar = true
		MusicController.play_menu_music()
		get_tree().change_scene("res://Cenas/Menu.tscn")
	#mudança de cena e efeito sonoro
	
func _on_restart_pressed():
	$Transicao/fill/AnimationPlayer.play("Fora")
	#alterando texturas dos botões para não serem interativas após um ser pressionado
	$restart.texture_normal = $restart.texture_hover
	$menu.texture_hover = null
	$Creditos.texture_hover = null
	#reiniciando a pontuação
	Global.points = 0
		
	hover = 1
	if !$SomConfirmar.playing:
		$SomConfirmar.play()
		podeAtualizar = true
		LoadingScreen.load_scene(self, "res://Cenas/Game.tscn")
#mudança de cena e efeito sonoro


func _on_Creditos_pressed():
	$Transicao/fill/AnimationPlayer.play("Fora")
	$restart.texture_hover = null
	$menu.texture_hover = null
	$Creditos.texture_normal = $Creditos.texture_hover

	hover = 1
	if !$SomConfirmar.playing:
		$SomConfirmar.play()
		yield(get_tree().create_timer(0.25), "timeout")
		get_tree().change_scene("res://Cenas/Creditos.tscn")

#funções de efeito sonoro
func _on_restart_mouse_entered():
	som_hover()

func _on_menu_mouse_entered():
	som_hover()

func _on_Creditos_mouse_entered():
	som_hover()

#função que ordena as pontuações e nomes em ordem descrescente
func ordenacaoDoRanking():
	Global.salvar_dados()
	Global.listaPontos.insert(0, Global.points/12)
	Global.listaNomes.insert(0, Global.nome)

	if len(Global.listaPontos) > 1:
		for i in range(1, len(Global.listaPontos)): #iterando os elementos da lista
			var elem = Global.listaPontos[i] #elemento atual
			var n = Global.listaNomes[i]
			var a = i #criando uma variável secundária para poder trabalhar com o valor de i sem problemas
			while a>0 and elem > Global.listaPontos[a-1]: #verificando se o elemento atual é menor que seu antecessor
				Global.listaPontos[a] = Global.listaPontos[a-1] #se for, igualo o elemento a seu antecessor
				Global.listaNomes[a] = Global.listaNomes[a-1]
				a -=1 #diminuo o valor de a para verficar o elemento anterior e prosseguir com o loop
			Global.listaPontos[a] = elem #trocando a posição do elemento iterado no loop "for"
			Global.listaNomes[a] = n

	if len(Global.listaPontos) == 6:
		Global.listaPontos.remove(-1)
		Global.listaNomes.remove(-1)
	mostrarRanking()
#função que preenche as labels com seus respectivos dados
func mostrarRanking():

	var tamanho = len(Global.listaPontos)
	
	#se o tamanho da lista for menor ou igual á 1 os dados do 1° lugar são mostrados
	if tamanho >= 1:
		$nome1.text = Global.listaNomes[0]
		$ponto1.text = str(Global.listaPontos[0])
	
	if tamanho >= 2:
		$nome2.text = Global.listaNomes[1]
		$ponto2.text = str(Global.listaPontos[1])
	
	if tamanho >= 3:
		$nome3.text = Global.listaNomes[2]
		$ponto3.text = str(Global.listaPontos[2])
	
	if tamanho >= 4:
		$nome4.text = Global.listaNomes[3]
		$ponto4.text = str(Global.listaPontos[3])
	
	if tamanho >= 5:
		$nome5.text = Global.listaNomes[4]
		$ponto5.text = str(Global.listaPontos[4])
		
#Quando o botão atualizar é pressionado as pontuações são ordenadas, o ranking é mostrado e os dados são salvos
func _on_Atualizar_pressed():
	if podeAtualizar == true:
		ordenacaoDoRanking()
		Global.salvar_dados()
		podeAtualizar = false
	else:
		pass
