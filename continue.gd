extends Button

func _ready(): 
	hide() #hides button at the start


func _on_pressed():
	get_tree().change_scene_to_file("res://third_window.tscn")
