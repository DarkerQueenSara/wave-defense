extends Node2D

const CREDITS_MENU = preload("res://scenes/menus/credits_menu.tscn")
@export var healthTotal: int
var curHealth = 0

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemies"):
		body.queue_free();
		print("got hit")
		curHealth -= body.enemyDamage;
		if (curHealth <= 0):
			if (Global.score > Global.highScore): Global.highScore = Global.score;
			get_tree().change_scene_to_packed(CREDITS_MENU)
