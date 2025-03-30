extends CharacterBody2D

@export var enemySpeed: float;
@export var enemyDamage: int;
@export var enemyHealth: int;
var currentHealth: int;
var currentLookAt: Vector2 = Vector2(0,0);
var spawnPointPos: Vector2;

func _ready() -> void:
	currentHealth = enemyHealth;

func _physics_process(delta: float) -> void:
	self.look_at(currentLookAt);
	velocity = transform.x * enemySpeed;
	move_and_slide()

func take_damage():
	print("took damage")
	currentHealth -= 1;
	print(currentHealth)
	if (currentHealth < 1):
		self.queue_free();
