extends Node2D
var start_position 

# Called when the node enters the scene tree for the first time.
func _ready():
	start_position = global_position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += Vector2(0, 100 * delta)
	pass


func _on_visible_on_screen_notifier_2d_screen_exited():
	print("offscreen")
	position = start_position
	pass # Replace with function body.
