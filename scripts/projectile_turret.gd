extends TurretBase;

@export var projectile: PackedScene;

var enemy;

func _physics_process(delta: float) -> void:
	if (enemy_array.size() > 0):
		select_enemy();
		turn()

func select_enemy():
	var enemy_progress_array = [];
	for i in enemy_array:
		enemy_progress_array.append(i.distance_to(Vector2(0,0)));
	var closest_distance = enemy_progress_array.min();
	var enemy_index = enemy_progress_array.find(closest_distance);
	enemy = enemy_array[enemy_index];

func turn():
	if enemy: $Sprite2D.look_at(enemy.global_position);

func fire():
	var b = projectile.instantiate();
	get_tree().root.add_child(b);
	b.transform = $Sprite2D/Marker2D.global_transform;

func _on_timer_timeout() -> void:
	fire();
