extends Button

#When the Start button is pressed, send user to the next window
func _on_pressed():
	get_tree().change_scene_to_file("res://second_window.tscn")
