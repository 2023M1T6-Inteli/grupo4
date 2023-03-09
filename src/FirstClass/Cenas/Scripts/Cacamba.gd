extends RigidBody2D

func _ready():
	set_max_contacts_reported(3)
	set_contact_monitor(true)
	if Global.cargaDoCaminhao == 1:
		$AnimatedSprite.animation = "Cloro"
	
	elif Global.cargaDoCaminhao == 2:
		$AnimatedSprite.animation = "Soda"
	
	elif Global.cargaDoCaminhao == 3:
		$AnimatedSprite.animation = "PVC"

# Função que efetua atroca do sprite das cargas, possibilitando diferentes cargas para o jogo

func _on_Cacamba_do_Caminhao_body_entered(body):
	if body.name =="Player" or body.name =="Debufs":
		pass
	else:
		get_tree().change_scene("res://Cenas/tela_gameover.tscn")
# Função que permite a caçamba contar como parte do player e causar a derrota do jogador caso ela
# colida com a parede
