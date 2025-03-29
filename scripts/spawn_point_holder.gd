extends Node2D

@export var startingEnemies: int;
@export var enemyGrowthFactor: float;
@export var enemyArray: Array[PackedScene];
@export var spawnPoints: Array[Node2D];

var currentEnemies: int;
var currentWave: int = 0;

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rng.seed = hash("Wave Race 64");
	currentEnemies = startingEnemies;

func getRandomEnemy() -> PackedScene:
	var random_float = rng.randf();
	if (random_float < 0.75):
		return enemyArray[0];
	if (random_float < 0.85):
		return enemyArray[1];
	return enemyArray[2];
	

func _on_wave_timer_timeout() -> void:
	currentEnemies += roundf(currentWave * enemyGrowthFactor);
	for e in currentEnemies:
		var index = rng.randi_range(0,7);
		var randomEnemy = getRandomEnemy();
		var spawnedEnemy = randomEnemy.instantiate();
		get_tree().get_root().add_child(spawnedEnemy);
		spawnedEnemy.global_position = spawnPoints[index].global_position;
		spawnedEnemy.look_at(Vector2(0, 0));
		spawnedEnemy.spawnPointPos = spawnPoints[index].global_position;
		
		
