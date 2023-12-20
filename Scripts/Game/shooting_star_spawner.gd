extends Node2D
const shooting_star_scene = preload("res://Scenes/Animations/shooting_star.tscn")
var start_postition

func _ready():
	add_star()#start with an star 
#ENDFUNC

func _process(_delta):
	if get_child_count() == 0:# check if we have objects
		change_position()
		start_postition = global_position
		add_star()
#ENDFUNC
	
func change_position():
	var random_number = randi_range(100, 1820)
	global_position = Vector2(random_number, 0)# sets the spawner to a random position
	
#ENDFUNC
	
func add_star():
	var shooting_star = shooting_star_scene.instantiate()
	add_child(shooting_star)
	pass
#ENDFUNC
