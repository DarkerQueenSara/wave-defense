extends TurretBase;

@export var projectile: PackedScene;

var enemy;

@onready var collision_shape_2d: CollisionShape2D = $Area2D/CollisionShape2D

func _init() -> void:
	#collision_shape_2d.scale
	pass
func _physics_process(delta: float) -> void:
	if (enemy_array.size() > 0):
		select_enemy();
		turn()

func select_enemy():
	var enemy_progress_array = [];
	for i in enemy_array:
		enemy_progress_array.append(i.global_position.distance_to(Vector2(0,0)));
		#enemy_progress_array.append(i.global_position.distance_to(global_position));
	var closest_distance = enemy_progress_array.min();
	var enemy_index = enemy_progress_array.find(closest_distance);
	enemy = enemy_array[enemy_index];
	#enemy = enemy_progress_array[enemy_index];
	#if enemy_array.is_empty():
		#return  # Prevent errors if there are no enemies
	#
	#var closest_enemy = null
	#var closest_distance = INF  # Start with a very large number
	#
	#for i in enemy_array:
		#var distance = i.global_position.distance_to(Vector2(0,0))
		#if distance < closest_distance:
			#closest_distance = distance
			#closest_enemy = i
	#
	#enemy = closest_enemy  # Assign the closest enemy

func turn():
	if enemy: $Sprite2D.look_at(enemy.global_position);

func fire():
	var b = projectile.instantiate();
	#get_tree().root.add_child(b);
	get_parent().add_child(b)
	b.transform = $Sprite2D/Marker2D.global_transform;

func _on_timer_timeout() -> void:
	#if !enemy_progress_array.is_empty():
	fire();
#
#func _on_area_2d_body_entered(body: Node2D) -> void:
	#print("here1")
	#super(body);
	##body.get_parent().look_at(self.global_position);
#
#func _on_area_2d_body_exited(body: Node2D) -> void:
	#print("here2")
	#if (body.is_in_group("enemies")):
		#print("here3")
		#super(body);
	##body.get_parent().look_at(Vector2(0,0));
