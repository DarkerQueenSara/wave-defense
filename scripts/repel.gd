extends TurretBase

func _on_area_2d_body_entered(body: Node2D) -> void:
	super(body);
	body.get_parent().look_at(body.get_parent().spawnPointPos);

func _on_area_2d_body_exited(body: Node2D) -> void:
	super(body);
	body.get_parent().look_at(Vector2(0,0));
