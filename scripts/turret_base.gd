extends Node2D

class_name TurretBase

var enemy_array = [];

func _on_area_2d_body_entered(body: Node2D) -> void:
	enemy_array.append(body.get_parent());

func _on_area_2d_body_exited(body: Node2D) -> void:
	enemy_array.remove(body.get_parent());
