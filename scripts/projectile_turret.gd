extends TurretBase;

@export var projectile: PackedScene;

@onready var collision_shape_2d: CollisionShape2D = $Area2D/CollisionShape2D

func fire():
	var b = projectile.instantiate();
	get_parent().add_child(b)
	b.transform = $Sprite2D/Marker2D.global_transform;

func _on_timer_timeout() -> void:
	fire();
