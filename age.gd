extends LineEdit

var player_age: String = ""
var regex_l: = RegEx.new()
var regex_sc = RegEx.new()
@onready var invalid = get_node("Invalid_Input")
@onready var age = get_node("Invalid_Input/AgeError")
@onready var space = get_node("Invalid_Input/SpaceError")
@onready var letter = get_node("Invalid_Input/LetterError")
@onready var spec_char = get_node("Invalid_Input/SpecialCharError")
@onready var old = get_node("Invalid_Input/OldestError")
@onready var young = get_node("Invalid_Input/ChildError")
@onready var proceed = get_node("StartGame")

func _ready():
	regex_l.compile(r"[a-zA-Z]") #compiles the alphabet
	regex_sc.compile(r"[^\w\s]") #compiles special characters
func _on_text_changed(new_age):
	var search = regex_l.search(new_age) #searches if the input is in the regex compile
	var search2 = regex_sc.search(new_age)
	if " " in new_age:
		var cursor_place = caret_column #Save cursor
		text = new_age.replace(" ", "") #Replace space with nothing, removes the space
		caret_column = cursor_place - 1 #Reset cursor to saved
		invalid.show()
		space.show()
	if search: #if a letter is found, do the following:
		print("Found letter")
		var cursor_place = caret_column
		var replacedage = regex_l.sub(new_age, "",)
		text = replacedage
		caret_column = cursor_place - 1
		invalid.show()
		letter.show()
	if search2: #if a special character is found, do the following:
		print("Found Specchar")
		var cursor_place = caret_column
		var replacedage = regex_sc.sub(new_age, "",)
		text = replacedage
		caret_column = cursor_place - 1
		invalid.show()
		spec_char.show()
		

func _on_text_submitted(new_age):
	var int_age = int(new_age)
	if new_age.is_empty():
		invalid.show()
		age.show()
	elif int_age > 123: #Error popup if age is over maximum
		invalid.show()
		old.show()
	elif int_age < 10 and int_age > -1:
		invalid.show() #Error popup if age is under minimum
		young.show()
	else:
		editable = false
		player_age = new_age
		print("Age = ", player_age)
		proceed.show()
		var file := FileAccess.open("user://player_age.txt", FileAccess.WRITE)
		file.store_string(player_age)
		file.close()

func _on_invalid_input_close_requested():
	invalid.hide()
	age.hide()
	space.hide()
	old.hide()
	young.hide()
	letter.hide()
	spec_char.hide()
#hides the messages in the pop up once closed so that new messages won't overlap
