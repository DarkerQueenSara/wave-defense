extends CharacterBody2D

const TOWER = preload("res://scenes/tower.tscn")
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var amount = 0
var towersAvailable = 5

func _physics_process(delta: float) -> void:
	var input_dir = Input.get_vector("left","right","up","down")	
	velocity = input_dir * SPEED

	move_and_slide()
	
	if (Input.is_action_just_pressed("build")):
		if towersAvailable > 0:
			var newTower = TOWER.instantiate()
			newTower.global_position = global_position
			get_tree().root.add_child(newTower)
			towersAvailable -= 1
		else:
			print("no build")


func _on_area_2d_area_entered(area: Area2D) -> void:
	if (area.is_in_group("resource")):
		amount += area.amount
		print(amount)
		area.queue_free()
