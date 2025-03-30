extends Control

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$MarginContainer/HBoxContainer/TimeSurvived.text = "Score: " + str(Global.score);
	$MarginContainer/HBoxContainer2/TimeToNextWave.text = str(round($"../EnemyWaveTimer".time_left));
	$MarginContainer/HBoxContainer2/VBoxContainer/Resources.text = str($"../Player".amount);
