extends Area2D

const MAIN_SCENE = preload("res://scenes/main_scene.tscn")
const PLAYER = preload("res://scenes/player.tscn")
signal t_collision
var activation_time = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	activation_time = Time.get_ticks_msec()
	var rootChildren = get_parent().get_children()
	for child in rootChildren:
		if (child.is_in_group("player")):
			t_collision.connect(child.t_collision_func)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Time.get_ticks_msec() - activation_time >= 3.0:
		get_tree().free()


func _on_area_entered(area: Area2D) -> void:
	if (area.is_in_group("tower")):
		t_collision.emit(self)
