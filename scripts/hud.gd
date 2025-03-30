extends Control

func seconds2mmss(total_seconds: float) -> String:
	#total_seconds = 12345
	var seconds:float = fmod(total_seconds , 60.0)
	var minutes:int   =  int(total_seconds / 60.0) % 60
	var mmss_string:String = "%02d:%05.2f" % [minutes, seconds]
	return mmss_string

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$MarginContainer/HBoxContainer/TimeSurvived.text = "Score: " + str(seconds2mmss(Global.score));
	$MarginContainer/HBoxContainer2/TimeToNextWave.text = str(round($"../EnemyWaveTimer".time_left));
	$MarginContainer/HBoxContainer2/VBoxContainer/Resources.text = str($"../Player".amount);
	$MarginContainer/HBoxContainer/Island.text = str($"../Island/IslandArea".curHealth);
