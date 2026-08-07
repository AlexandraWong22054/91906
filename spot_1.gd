extends Label

@onready var Game1 = get_node("PanelContainer")

func _on_mouse_entered():
	Game1.show()

func _on_mouse_exited():
	Game1.hide()
