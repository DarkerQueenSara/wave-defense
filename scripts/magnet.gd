extends TurretBase

func _on_area_2d_body_entered(body: Node2D) -> void:
	if (body.is_in_group("enemies")):
		print("here")
		super(body);
		body.currentLookAt = self.global_position;
#
func _on_area_2d_body_exited(body: Node2D) -> void:
	if (body.is_in_group("enemies")):
		super(body);
		body.currentLookAt = Vector2(0,0);
