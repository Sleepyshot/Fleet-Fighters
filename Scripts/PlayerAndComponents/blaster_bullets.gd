extends Node2D
@export var bullet_speed = 600
var movement_vector : = Vector2(0,-1)
const explosion_scene = preload("res://Scenes/Animations/explosion_1.tscn")

	
func _process(delta):
		global_position += movement_vector.rotated(rotation) * bullet_speed * delta
#ENDFUNC

func _on_area_entered(_area):
	var explosion1 = explosion_scene.instantiate()# create the explsion node
	explosion1.position = $Sprite2D.global_position# set the position of the node
	get_parent().add_child(explosion1)# add the node to the parent tree
	var explosion2 = explosion_scene.instantiate()# create the explsion node
	explosion2.position = $Sprite2D2.global_position # set the position of the node
	get_parent().add_child(explosion2)# add the node to the parent tree
	self.queue_free() # remove the bullet
#ENDFUNC

func _on_visible_on_screen_notifier_2d_screen_exited():# when exiting the screen
	self.queue_free()# remove the bullet
#ENDFUNC.
