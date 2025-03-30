extends Node2D

class_name TurretBase

const MAIN_SCENE = preload("res://scenes/main_scene.tscn")
const PLAYER = preload("res://scenes/player.tscn")
signal t_collision
var activation_time = 0
var enemy_array = [];
var enemy;

func _ready() -> void:
	activation_time = Time.get_ticks_msec()
	var rootChildren = get_parent().get_children()
	for child in rootChildren:
		if (child.is_in_group("player")):
			t_collision.connect(child.t_collision_func)

func _physics_process(delta: float) -> void:
	if Time.get_ticks_msec() - activation_time >= 3000.0:
		queue_free()
	if (enemy_array.size() > 0):
		select_enemy();
		turn()

func select_enemy():
	if enemy_array.size() == 0: enemy = null
	var enemy_progress_array = [];
	for i in enemy_array:
		enemy_progress_array.append(i.global_position.distance_to(Vector2(0,0)));
	var closest_distance = enemy_progress_array.min();
	var enemy_index = enemy_progress_array.find(closest_distance);
	enemy = enemy_array[enemy_index];

func turn():
	if enemy != null: $Sprite2D.look_at(enemy.global_position);

func _on_area_2d_body_entered(body: Node2D) -> void:
	print("Entered turret")
	print(body);
	if not body.is_in_group("enemies"): return;
	enemy_array.append(body);

func _on_area_2d_body_exited(body: Node2D) -> void:
	print("Entered turret")
	print(body);
	if not body.is_in_group("enemies"): return;
	var enemy = body
	if enemy in enemy_array:
		enemy_array.erase(enemy)
	else:
		print("Enemy not found in array:", enemy)

func _on_spawn_collision_area_entered(area: Area2D) -> void:
	if (area.is_in_group("tower")):
		t_collision.emit(self)
