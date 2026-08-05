extends LineEdit

var player_age : String = ""
var regexL: = RegEx.new()
var regexSC = RegEx.new()
@onready var Invalid = get_node("Invalid_Input")
@onready var Age = get_node("Invalid_Input/AgeError")
@onready var Space = get_node("Invalid_Input/SpaceError")
@onready var Letter = get_node("Invalid_Input/LetterError")
@onready var SpecChar = get_node("Invalid_Input/SpecialCharError")
@onready var Old = get_node("Invalid_Input/OldestError")
@onready var Young = get_node("Invalid_Input/ChildError")
@onready var Continue = get_node("StartGame")

func _ready():
	regexL.compile(r"[a-zA-Z]") #compiles the alphabet to later check if the input includes a letter.
	regexSC.compile(r"[^\w\s]")
func _on_text_changed(new_age):
	var search = regexL.search(new_age) #searches if the input is in the regex compile
	var search2 = regexSC.search(new_age)
	if " " in new_age:
		var cursor_place = caret_column #Save cursor
		text = new_age.replace(" ","") #Replace space with nothing, removes the space
		caret_column = cursor_place -1 #Reset cursor to saved
		Invalid.show() 
		Space.show()
	if search:
		print("Found letter")
		var cursor_place = caret_column
		var replacedage = regexL.sub(new_age, "",)
		text = replacedage
		caret_column = cursor_place -1
		Invalid.show()
		Letter.show()
	if search2:
		print("Found Specchar")
		var cursor_place = caret_column
		var replacedage = regexSC.sub(new_age, "",)
		text = replacedage
		caret_column = cursor_place -1
		Invalid.show()
		SpecChar.show()

func _on_text_submitted(new_age):
	var int_age = int(new_age)
	if new_age.is_empty():
		Invalid.show()
		Age.show()
	elif int_age > 123: #Error popup if age is over maximum
		Invalid.show()
		Old.show()
	elif int_age < 10 and int_age > 0:
		Invalid.show() #Error popup if age is under minimum
		Young.show()
	else:
		editable = false
		player_age = new_age
		print("Age = ", player_age)
		Continue.show()

func _on_invalid_input_close_requested():
	Invalid.hide()
	Age.hide()
	Space.hide()
	Old.hide()
	Young.hide()
	Letter.hide()
#hides the messages in the pop up once closed so that new messages won't overlap
