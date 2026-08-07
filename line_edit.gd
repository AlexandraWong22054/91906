extends LineEdit

var player_name : String = ""
var regexN = RegEx.new()
var regexSC = RegEx.new()
#Calls other nodes and connects them to variables to use in this script.
@onready var Continue = get_node("Continue")
@onready var Greeting = get_node("Greeting")
@onready var Invalid = get_node("Invalid_Input")
@onready var Name = get_node("Invalid_Input/NameError")
@onready var Space = get_node("Invalid_Input/SpaceError")
@onready var Number = get_node("Invalid_Input/NumberError")
@onready var SpecChar = get_node("Invalid_Input/SpecialCharError")

func _ready():
	max_length = 15 #only 15 character limit
	regexN.compile(r"[0-9]") #compiles numbers.
	regexSC.compile(r"[^\w\s]") #compiles special characters
func _on_text_changed(new_text: String):
	var search = regexN.search(new_text)
	var search2 = regexSC.search(new_text)
	if " " in new_text: #if a space is input
		var cursor_place = caret_column #saves where the cursor most recently is
		text = new_text.replace(" ","") #when space button is pressed, remove the space from occuring
		caret_column = cursor_place -1 #Resets cursor place so that inputing a space doesn't move back to the start
		Invalid.show() #error window pops up
		Space.show() #specific error message pops up
	if search:
		var cursor_place = caret_column 
		var replaced_name = regexN.sub(new_text, "",)
		text = replaced_name
		caret_column = cursor_place -1
		Invalid.show()
		Number.show()
	if search2:
		print("Found Specchar")
		var cursor_place = caret_column
		var replaced_name = regexSC.sub(new_text, "",)
		text = replaced_name
		caret_column = cursor_place -1
		Invalid.show()
		SpecChar.show()
#Changes Player name to the submitted text
func _on_text_submitted(new_text: String): 
	if new_text.is_empty():
		Invalid.show() #Shows popup window
		Name.show()
	else:
		editable = false #prevents user from changing name after entering
		player_name = new_text
		print("Name = ", player_name)
		Continue.show() #Shows the "Click to Continue" button
		Greeting.text = (str("Hello, ") + (player_name))

func _on_no_input_close_requested(): #hides the popup window when the x is clicked.
	Invalid.hide()
	Name.hide()
	Space.hide()
	Number.hide()
	SpecChar.hide()
