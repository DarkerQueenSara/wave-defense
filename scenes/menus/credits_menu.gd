extends Control

func seconds2mmss(total_seconds: float) -> String:
	#total_seconds = 12345
	var seconds:float = fmod(total_seconds , 60.0)
	var minutes:int   =  int(total_seconds / 60.0) % 60
	var mmss_string:String = "%02d:%05.2f" % [minutes, seconds]
	return mmss_string
	
func _ready() -> void:
	$MarginContainer/VBoxContainer/Label.text = "Time Survived: " + seconds2mmss(Global.score);
	$MarginContainer/VBoxContainer/Label3.text = "Longest Record: " + seconds2mmss(Global.highScore);
	
func _on_back_to_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menus/main_menu.tscn")


func _on_play_again_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_scene.tscn")


func _on_exit_game_pressed() -> void:
	get_tree().quit()
