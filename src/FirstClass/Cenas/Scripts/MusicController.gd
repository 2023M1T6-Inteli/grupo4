extends Node

#essa cena controla a maior parte dos efeitos sonoros e a trilha sonora dentro do jogo

var menuMusic = preload("res://Sons/MusicaMenu.wav")
var gameMusic = preload("res://Sons/MusicaGame.wav")
var gameOverMusic = preload("res://Sons/MusicaGameOver.wav")
var bebidaSound = preload("res://Sons/debuff_bebida .wav")
var cargaSound = preload("res://Sons/debuff_carga_pesada.wav")
var celularSound = preload("res://Sons/debuff_celular .wav")
var sonoSound = preload("res://Sons/debuff_sono.wav")

func play_menu_music():

	$Music.stream = menuMusic
	$Music.play()
	

func play_game_music():
	
	$Music.stream = gameMusic
	$Music.play()


func play_game_over_music():
	
	$Music.stream = gameOverMusic
	$Music.play()


func debuff_sono_sound():
	$Effects2.stream = sonoSound
	$Music.volume_db = -35
	$Effects2.play()

func debuff_bebida_sound():
	$Effects2.stream = bebidaSound
	$Music.volume_db = -35
	$Effects2.play()

func debuff_carga_pesada_sound():
	$Effects1.stream = cargaSound
	$Effects1.volume_db = 0
	$Effects1.play()

func debuff_celular_sound():
	$Effects1.stream = celularSound
	$Music.volume_db = -35
	$Effects1.play()

func debuffs1_sound_off():
	$Effects1.stop()
	$Effects1.volume_db = -17
	if $Effects2.playing == false:
		$Music.volume_db = -17

func debuffs2_sound_off():
	$Effects2.stop()
	$Music.volume_db = -17

func stop_music():
	$Music.stop()
