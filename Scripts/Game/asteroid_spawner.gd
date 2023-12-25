extends Node2D

const asteroid_scene = preload("res://Scenes/Objects/asteroid.tscn")

var start_postition

func _ready():
	add_asteroid()#start with an asteroid 
#ENDFUNC

func _process(_delta):
	if get_child_count() == 0:# check if we have objects
		change_position()
		start_postition = global_position
		add_asteroid()
#ENDFUNC
	
func change_position():
	var random_number = randi_range(100, 1820)
	global_position = Vector2(random_number, 0)# sets the spawner to a random position
	
#ENDFUNC
	
func add_asteroid():
	var asteroid = asteroid_scene.instantiate()
	add_child(asteroid)
	pass
#ENDFUNC


