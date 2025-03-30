extends Node2D

const CREDITS_MENU = preload("res://scenes/menus/credits_menu.tscn")
@export var healthTotal: int
var curHealth = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	print("got hit1")
	if body.is_in_group("enemies"):
		print("got hit")
		curHealth -= body.get_parent().enemyDamage;
		if (curHealth <= 0):
			Global.score = 0
			get_tree().change_scene_to_packed(CREDITS_MENU)


func _on_area_2d_area_entered(area: Area2D) -> void:
	print("got hit2")
	if area.is_in_group("enemies"):
		print("got hit")
		curHealth -= area.get_parent().enemyDamage;
		if (curHealth <= 0):
			Global.score = 0
			get_tree().change_scene_to_packed(CREDITS_MENU)
