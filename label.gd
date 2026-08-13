extends Label

@onready var username = get_node("Name") 
@onready var userage = get_node("Age")

func _ready():
	var namevar := " " 
	#checks if user has entered a name
	if FileAccess.file_exists("user://player_name.txt"): 
		var file := FileAccess.open("user://player_name.txt", FileAccess.READ) #reads the usersname 
		namevar = file.get_as_text()
		file.close
		var username_str = str(namevar) #converts name to string
		username.text = (str("USER NAME = ") + (username_str)) #Puts name in label
	
	var agevar := " "
	#checks if user has entered an age
	if FileAccess.file_exists("user://player_age.txt"):
		var file := FileAccess.open("user://player_age.txt", FileAccess.READ) #reads the users age
		agevar = file.get_as_text()
		file.close
		var userage_str = str(agevar) #converts age to string
		userage.text = (str("USER AGE = ") + (userage_str)) #puts name in label
