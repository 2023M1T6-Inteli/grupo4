extends Node2D

#Variável responsável por armazenar a quantidade de gasolina
var gasolina

func _ready():
	gasolina = 5000
	set_process(true)
	
#Função que atualiza a variável "vida" a cada segundo
func _process(delta):
	yield(get_tree().create_timer(1.0), "timeout")
	gasolina -= rand_range(1,1) #Diminuindo o valor da variável "gasolina em um valor aleatório entre 1 e 1 a cada segundo
	if gasolina < 0:
		gasolina = 0
	$ProgressBar.value = gasolina #Definindo o valor da barra de progresso para o valor atual da variável "gasolina"
	
	#Condição que leva para tela de Game Over caso a gasolina chegue a 0
	if gasolina==0:
		get_tree().change_scene("res://Cenas/Tela_Gameover.tscn")

func _on_ProgressBar_ready():
	pass # Replace with function body.
