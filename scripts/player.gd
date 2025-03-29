extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var amount = 0

func _physics_process(delta: float) -> void:
	var input_dir = Input.get_vector("left","right","up","down")	
	velocity = input_dir * SPEED

	move_and_slide()


func _on_area_2d_area_entered(area: Area2D) -> void:
	if (area.is_in_group("resource")):
		amount += area.amount
		print(amount)
		area.queue_free()
