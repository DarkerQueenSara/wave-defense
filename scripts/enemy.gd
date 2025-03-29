extends Node2D

@export var enemySpeed: float;
@export var enemyDamage: int;
@export var enemyHealth: int;
var currentHealth: int;
var currentLookAt: Vector2 = Vector2(0,0);
var spawnPointPos: Vector2;

func _physics_process(delta):
	self.look_at(currentLookAt);
	position += transform.x * enemySpeed * delta;

func take_damage():
	currentHealth -= 1;
	if (currentHealth < 1):
		self.queue_free();
