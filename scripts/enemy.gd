extends Node2D

@export var enemySpeed: float;
@export var enemyDamage: int;
@export var enemyHealth: int;
var currentHealth: int;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	look_at(Vector2(0,0))
	
func _physics_process(delta):
	position += transform.x * enemySpeed * delta;
