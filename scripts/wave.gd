extends Node2D

@export var scaleFactor: float = 1.5;
@export var waveSpeed: float = 20;

func _physics_process(delta):
	position += transform.x * waveSpeed * delta;

func _on_death_timer_timeout() -> void:
	self.queue_free();

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("resource") or body.is_in_group("tower"): return;
	body.get_node("Sprite2D").scale *= scaleFactor;
	if body.is_in_group("enemies"):
		body.take_damage();

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("resource") or body.is_in_group("tower"): return;
	body.get_node("Sprite2D").scale /= scaleFactor;
