extends TurretBase

func _on_area_2d_body_entered(body: Node2D) -> void:
	if (body.is_in_group("enemies")):
		super(body);
		body.currentLookAt = body.spawnPointPos;

func _on_area_2d_body_exited(body: Node2D) -> void:
	if (body.is_in_group("enemies")):
		super(body);
		body.currentLookAt = Vector2(0,0);
