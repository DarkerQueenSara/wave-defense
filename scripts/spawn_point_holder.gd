extends Node2D

@export var startingEnemies: int;
@export var enemyGrowthFactor: float;
@export var enemyArray: Array[PackedScene];
@export var spawnPoints: Array[Node2D];
@export var wavePrefab: PackedScene;

@export var playAreaRadius: int = 540;

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
		
		

func _random_inside_unit_circle() -> Vector2:
	var theta : float = rng.randf() * 2 * PI
	return Vector2(cos(theta), sin(theta)) * sqrt(rng.randf())

func _on_water_wave_timer_timeout() -> void:
	var spawnPoint = _random_inside_unit_circle() * playAreaRadius;
	var directionPoint = _random_inside_unit_circle() * playAreaRadius;
	var spawnedWave = wavePrefab.instantiate();
	$"../WaveSpawner".add_child(spawnedWave);
	spawnedWave.global_position = spawnPoint.global_position;
	spawnedWave.look_at(directionPoint);
