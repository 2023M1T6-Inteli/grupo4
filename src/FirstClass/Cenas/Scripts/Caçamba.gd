extends RigidBody2D

func _ready():
	if Global.cargaDoCaminhao == 1:
		$AnimatedSprite.animation = "Cloro"
	
	elif Global.cargaDoCaminhao == 2:
		$AnimatedSprite.animation = "Soda"
	
	elif Global.cargaDoCaminhao == 3:
		$AnimatedSprite.animation = "PVC"
	

