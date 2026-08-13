extends Label

#Calls the nodes to use as variables
@onready var left_button = get_node("Left")
@onready var right_button = get_node("Right")
@onready var left_label = get_node("LeftLabel")
@onready var right_label = get_node("RightLabel")
@onready var next_round = get_node("Next")
@onready var game_return = get_node("Return")
@onready var applesAI = get_node("ApplesAi")
@onready var applesREAL = get_node("Applereal")
@onready var phoneAI = get_node("PhoneAi")
@onready var phoneREAL = get_node("PhoneReal")
@onready var deerAI = get_node("Deerfake")
@onready var deerREAL = get_node("Deer")
var counter: int = 0 #Keeps track of what round of the game it is
var score : int = 0 #Keeps track of the player's score

func _ready():
	applesAI.show()
	applesREAL.show()


#For the left-side button
func _on_left_pressed():
	if counter == 0: #indicates the first round
		left_label.text = "Correct! This image is real!"
		left_label.show()
		left_button.disabled = true #prevents from pressing the buttons again
		right_button.disabled = true
		counter = 1 #Adding to the counter indicates the round has passed
		score += 1 #Correct answer adds to the score
		next_round.show() #Shows next round button
	elif counter == 1: #Round 2
		left_button.disabled = true
		right_button.disabled = true
		left_label.text = "Correct! This image is real!"
		left_label.show()
		next_round.show()
		counter = 2
		score += 1
	elif counter == 2: #Round 3
		left_button.disabled = true
		right_button.disabled = true
		left_label.text = "Incorrect! This image is AI!"
		left_label.show()
		next_round.show()
		counter = 3
		game_return.show()
		var finalscore = str(score)
		text = (str("FINAL SCORE: ") + (finalscore) + (" out of 3"))
	

#For the right-side button
func _on_right_pressed():
	if counter == 0:
		print("round 1")
		right_label.text = "Incorrect! This image is AI!"
		right_label.show()
		left_button.disabled = true
		right_button.disabled = true
		counter = 1
		next_round.show()
	elif counter == 1:
		print("round 2")
		left_button.disabled = true
		right_button.disabled = true
		right_label.text = "Incorrect! This image is AI!"
		right_label.show()
		next_round.show()
		counter = 2
	elif counter == 2:
		left_button.disabled = true
		right_button.disabled = true
		right_label.text = "Correct! This image is real!"
		right_label.show()
		counter = 3
		score += 1
		game_return.show()
		var finalscore = str(score)
		text = (str("FINAL SCORE: ") + (finalscore) + (" out of 3"))

func _on_next_pressed(): 
	next_round.hide() #hides itself
	right_label.hide() #hides whatever label is showing
	left_label.hide()
	left_button.disabled = false #allows the buttons to be pressed again
	right_button.disabled = false
	if counter == 1:
		phoneAI.show()
		phoneREAL.show()
		applesAI.hide()
		applesREAL.hide()
	elif counter == 2:
		phoneAI.hide()
		phoneREAL.hide()
		deerAI.show()
		deerREAL.show()


func _on_return_pressed(): #Returns to the minigame screen
	get_tree().change_scene_to_file("res://fourth_window.tscn")
