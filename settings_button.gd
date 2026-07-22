extends Button

#When the Settings button is pressed, send user to the Seettings window

func _on_pressed():
	get_tree().change_scene_to_file("res://settings_window.tscn")
