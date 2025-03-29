extends CharacterBody2D

const MAGNET = preload("res://scenes/magnet.tscn")
const REPEL = preload("res://scenes/repel.tscn")
const PROJECTILE_TURRET = preload("res://scenes/projectile_turret.tscn")
#const TOWER = preload("res://scenes/tower.tscn")
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var amount = 0
var towersAvailable = 5
var isWorkingOnCollision = false
var triggered_objects = []
var rotation_speed = 1.5

var tower_scenes = {
	"towerNormal": PROJECTILE_TURRET,
	"towerRepel": REPEL,
	"towerMagnet": MAGNET
	}

func _init() -> void:
	look_at(Vector2(1,0))

func _physics_process(delta: float) -> void:
	var input_move = Input.get_axis("up","down")
	var input_rotate = Input.get_axis("left","right")
	
	if input_move:
		velocity = transform.y *  input_move * SPEED
	else:
		velocity = Vector2.ZERO
	if input_rotate:
		rotation += input_rotate * rotation_speed * delta

	move_and_slide()
	
	for action in tower_scenes.keys():
		if Input.is_action_just_pressed(action):
			place_tower(tower_scenes[action])
	
	#if (Input.is_action_just_pressed("towerNormal")):
		#if towersAvailable > 0:
			#var newTower = PROJECTILE_TURRET.instantiate()
			#newTower.global_position = global_position
			#get_parent().add_child(newTower)
			#towersAvailable -= 1
		#else:
			#print("no build")
	#
	#if (Input.is_action_just_pressed("towerRepel")):
		#if towersAvailable > 0:
			#var newTower = REPEL.instantiate()
			#newTower.global_position = global_position
			#get_parent().add_child(newTower)
			#towersAvailable -= 1
		#else:
			#print("no build")
	#
	#if (Input.is_action_just_pressed("towerMagnet")):
		#if towersAvailable > 0:
			#var newTower = MAGNET.instantiate()
			#newTower.global_position = global_position
			#get_parent().add_child(newTower)
			#towersAvailable -= 1
		#else:
			#print("no build")


func _on_area_2d_area_entered(area: Area2D) -> void:
	if (area.is_in_group("resource")):
		amount += area.amount
		print(amount)
		area.queue_free()

func t_collision_func(tower):
	print("heu")
	triggered_objects.append(tower)
	if (triggered_objects.size() == 2):
		print("heee")
		triggered_objects.sort_custom(func(a, b): return a.activation_time > b.activation_time)
		triggered_objects[0].queue_free()
		triggered_objects.clear()
		

func place_tower(tower_scene):
	if towersAvailable > 0:
		var newTower = tower_scene.instantiate()
		newTower.global_position = global_position
		get_parent().add_child(newTower)
		towersAvailable -= 1
	else:
		print("No build")
