extends LineEdit

var player_name : String = ""
@onready var Continue = get_node("Continue")
@onready var Greeting = get_node("Greeting")

func _ready():
	max_length = 15 #only 15 character limit



#Changes Player name to the submitted text
func _on_text_submitted(new_text: String):
	player_name = new_text
	print("Name = ", player_name)
	Continue.show() #Shows the "Click to Continue" button
	Greeting.text = (str("Hello, ") + (player_name))
