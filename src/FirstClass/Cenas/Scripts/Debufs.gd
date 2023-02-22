extends Node2D

var random_Number = RandomNumberGenerator.new()

func _ready():
	random_Number.randomize()
	var debuf = random_Number.randi_range(1,4)
	print(debuf)
	
	if debuf == 1:
		$Bebida.visible = true
		$"Carga Pesada".visible = false
		$Celular.visible = false
		$Sono.visible = false
		
		$"Carga Pesada/CollisionShape2D".remove_and_skip()
		$Celular/CollisionShape2D.remove_and_skip()
		$Sono/CollisionShape2D.remove_and_skip()
		
	
	elif debuf == 2:
		$Bebida.visible = false
		$"Carga Pesada".visible = true
		$Celular.visible = false
		$Sono.visible = false
		
		$Bebida/CollisionShape2D.remove_and_skip()
		$Celular/CollisionShape2D.remove_and_skip()
		$Sono/CollisionShape2D.remove_and_skip()
		
	elif debuf == 3:
		$Bebida.visible = false
		$"Carga Pesada".visible = false
		$Celular.visible = true
		$Sono.visible = false
		
		$Bebida/CollisionShape2D.remove_and_skip()
		$"Carga Pesada/CollisionShape2D".remove_and_skip()
		$Sono/CollisionShape2D.remove_and_skip()
		
	elif debuf == 4:
		$Bebida.visible = false
		$"Carga Pesada".visible = false
		$Celular.visible = false
		$Sono.visible = true
		
		$Bebida/CollisionShape2D.remove_and_skip()
		$"Carga Pesada/CollisionShape2D".remove_and_skip()
		$Celular/CollisionShape2D.remove_and_skip()
		
func _on_Bebida_area_entered(area):
	print("Bebida")
	
	
func _on_Celular_area_entered(area):
	print("Celular")


func _on_Carga_Pesada_area_entered(area):
	print("Carga pesada")


func _on_Sono_area_entered(area):
	print("Sono")
