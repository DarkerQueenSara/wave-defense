extends TurretBase

func _on_area_2d_body_entered(body: Node2D) -> void:
	super(body);
	body.get_parent().currentLookAt = body.get_parent().spawnPointPos;

func _on_area_2d_body_exited(body: Node2D) -> void:
	super(body);
	body.get_parent().currentLookAt = Vector2(0,0);
