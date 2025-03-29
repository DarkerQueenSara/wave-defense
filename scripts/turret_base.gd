extends Node2D

class_name TurretBase

const MAIN_SCENE = preload("res://scenes/main_scene.tscn")
const PLAYER = preload("res://scenes/player.tscn")
signal t_collision
var activation_time = 0
var enemy_array = [];

func _ready() -> void:
	activation_time = Time.get_ticks_msec()
	var rootChildren = get_parent().get_children()
	for child in rootChildren:
		if (child.is_in_group("player")):
			t_collision.connect(child.t_collision_func)

func _on_area_2d_body_entered(body: Node2D) -> void:
	enemy_array.append(body.get_parent());

func _on_area_2d_body_exited(body: Node2D) -> void:
	enemy_array.remove(body.get_parent());

func _on_area_2d_area_entered(area: Area2D) -> void:
	if (area.is_in_group("tower")):
		print("collision")
		t_collision.emit(self)
