extends CharacterBody2D

const TOWER = preload("res://scenes/tower.tscn")
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var amount = 0
var towersAvailable = 5
var isWorkingOnCollision = false
var triggered_objects = []
var rotation_speed = 1.5

func _init() -> void:
	look_at(Vector2(1,0))

func _physics_process(delta: float) -> void:
	#var input_dir = Input.get_vector("left","right","up","down")
	var input_move = Input.get_axis("up","down")
	var input_rotate = Input.get_axis("left","right")
	
	if input_move:
		velocity = transform.y *  input_move * SPEED
	else:
		velocity = Vector2.ZERO
	if input_rotate:
		rotation += input_rotate * rotation_speed * delta

	move_and_slide()
	
	if (Input.is_action_just_pressed("build")):
		if towersAvailable > 0:
			var newTower = TOWER.instantiate()
			newTower.global_position = global_position
			get_parent().add_child(newTower)
			towersAvailable -= 1
		else:
			print("no build")


func _on_area_2d_area_entered(area: Area2D) -> void:
	if (area.is_in_group("resource")):
		amount += area.amount
		print(amount)
		area.queue_free()

func t_collision_func(tower):
	triggered_objects.append(tower)
	if (triggered_objects.size() == 2):
		triggered_objects.sort_custom(func(a, b): return a.activation_time > b.activation_time)
		triggered_objects[0].queue_free()
		triggered_objects.clear()
		
