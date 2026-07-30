extends LineEdit

var player_age : String = ""
@onready var Invalid = get_node("Invalid_Input")
@onready var Age = get_node("Invalid_Input/AgeError")
@onready var Space = get_node("Invalid_Input/AgeError")
@onready var Letter = get_node("Invalid_Input/LetterError")
@onready var SpecChar = get_node("Invalid_Input/SpecialCharError")
@onready var Old = get_node("Invalid_Input/OldestError")
@onready var Young = get_node("Invalid_Input/ChildError")

func _on_text_changed(new_age):
	if " " in new_age:
		var cursor_place = caret_column #Save cursor
		text = new_age.replace(" ","") #Replace space with nothing, removes the space
		caret_column = cursor_place -1 #Reset cursor to saved
		Invalid.show() 
		Space.show()


func _on_text_submitted(new_age):
	var int_age = int(new_age)
	if new_age.is_empty():
		Invalid.show()
	if int_age > 123: #Error popup if age is over maximum
		Invalid.show()
		Old.show()
	if int_age < 10:
		Invalid.show() #Error popup if age is under minimum
		Young.show()


func _on_invalid_input_close_requested():
	Invalid.hide()
	Age.hide()
	Space.hide()
	Old.hide()
	Young.hide()
