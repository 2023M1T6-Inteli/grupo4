extends Node

func play_menu_music():

	$Music.stream = load("res://Sons/MusicaMenu.wav")
	$Music.play()
	

func play_game_music():
	
	$Music.stream = load("res://Sons/MusicaGame.wav")
	$Music.play()


func play_game_over_music():
	
	$Music.stream = load("res://Sons/MusicaGameOver.wav")
	$Music.play()


func debuff_sono_sound():
	$Effects2.stream = load("res://Sons/debuff_sono.wav")
	$Music.volume_db = -40
	$Effects2.play()

func debuff_bebida_sound():
	$Effects2.stream = load("res://Sons/debuff_bebida .wav")
	$Music.volume_db = -40
	$Effects2.play()

func debuff_carga_pesada_sound():
	$Effects1.stream = load("res://Sons/debuff_carga_pesada.wav")
	$Effects1.play()

func debuff_celular_sound():
	$Effects1.stream = load("res://Sons/debuff_celular .wav")
	$Music.volume_db = -40
	$Effects1.play()

func debuffs1_sound_off():
	$Effects1.stop()
	if $Effects2.playing == false:
		$Music.volume_db = -23

func debuffs2_sound_off():
	$Effects2.stop()
	$Music.volume_db = -23


