extends Label

@onready var Top = get_node("TopHeadline")
@onready var Bottom = get_node("BottomHeadline")
@onready var Buttontop = get_node("Topbutton")
@onready var buttonbottom = get_node("Bottombutton")
@onready var Answer = get_node("Answer")
@onready var next_round = get_node("next")
@onready var Leave = get_node("Back")
var counter : int = 0
var round2 : int = 0


func _ready():
	Top.text = "BREAKING NEWS: Local police FAIL to solve essential crime case!"
	Bottom.text = "BREAKING NEWS: Local police face criticism over unsolved 
criminal investigation"
	
func _on_topbutton_pressed():
	if round2 == 0:
		round2 = 1
		Buttontop.disabled = true
		buttonbottom.disabled = true
		next_round.show()
		Answer.text = "Correct!"
		Answer.show()
		counter += 1
	elif round2 == 1:
		round2 = 2
		Buttontop.disabled = true
		buttonbottom.disabled = true
		next_round.show()
		Answer.text = "Incorrect!"
		Answer.show()
	elif round2 == 2:
		round2 = 3
		Buttontop.disabled = true
		buttonbottom.disabled = true
		next_round.show()
		Answer.text = "Incorrect!"
		Answer.show()
	elif round2 == 3:
		round2 = 4
		Buttontop.disabled = true
		buttonbottom.disabled = true
		next_round.show()
		Answer.text = "Incorrect!"
		Answer.show()
	elif round2 == 4:
		counter += 1
		Buttontop.disabled = true
		buttonbottom.disabled = true
		Leave.show()
		Answer.text = "Correct!"
		Answer.show()
		var finalcounter = str(counter) #Changes score from int to str
		text = (str("FINAL SCORE: ") + (finalcounter) + (" out of 5"))

func _on_bottombutton_pressed():
	if round2 == 0:
		round2 = 1
		Buttontop.disabled = true
		buttonbottom.disabled = true
		next_round.show()
		Answer.text = "Incorrect!"
		Answer.show()
	elif round2 == 1:
		round2 = 2
		counter += 1
		Buttontop.disabled = true
		buttonbottom.disabled = true
		next_round.show()
		Answer.text = "Correct!"
		Answer.show()
	elif round2 == 2:
		round2 = 3
		counter += 1
		Buttontop.disabled = true
		buttonbottom.disabled = true
		next_round.show()
		Answer.text = "Correct!"
		Answer.show()
	elif round2 == 3:
		round2 = 4
		counter += 1
		Buttontop.disabled = true
		buttonbottom.disabled = true
		next_round.show()
		Answer.text = "Correct!"
		Answer.show()
	elif round2 == 4:
		Buttontop.disabled = true
		buttonbottom.disabled = true
		Leave.show()
		Answer.text = "Incorrect!"
		Answer.show()
		var finalround2 = str(round2) #Changes score from int to str
		text = (str("FINAL SCORE: ") + (finalround2) + (" out of 5"))



func _on_next_pressed():
	next_round.hide()
	Answer.hide()
	Buttontop.disabled = false
	buttonbottom.disabled = false
	if round2 == 1:
		Top.text = "New cafe faces backlash from customers for 
		'disturbing' and 'unncessesary' prices"
		Bottom.text = "Local cafe customers are disgusted by the overpriced, sub-par coffee"
	elif round2 == 2:
		Top.text = "Scientists discover surrounding indivudals can 
		impact personal intelligence."
		Bottom.text = "Keep your friends close and enemies closer: 
			Scientists realise idiocy is contagious."
	elif round2 == 3:
		Top.text = "Unveiling of park sculpture receives dissapointed reviews."
		Bottom.text = "SHOCKING new park statue creates public outrage!"
	elif round2 == 4:
		Top.text = "Foolish News Broadcaster shunned after confessing their biases"
		Bottom.text = "News Broadcaster creates tension with audience over personal views"
		
func _on_back_pressed():
	get_tree().change_scene_to_file("res://fourth_window.tscn")
