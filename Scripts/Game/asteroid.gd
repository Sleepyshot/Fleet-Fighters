extends Node2D
const destroy_animation = preload("res://Scenes/Animations/destroy_asteroid.tscn")
var asteroid_speed = 200
var current_position
var collision_damage := 10
var amount_awarded := 50


@onready var main = $"../../../"
func _process(delta):
	position += Vector2(0,asteroid_speed * delta)# move the asteroid down
	current_position = position# set the current position to this position
#ENDFUNC

func _on_area_2d_area_entered(area):
	if area.is_in_group("Projectile"):
		main.player_coins += amount_awarded
		
	var explode = destroy_animation.instantiate()
	explode.position = current_position# set position to the coordinates of the asteroid when it entered the area2d
	get_parent().add_child(explode)
	self.queue_free()#remove the asteroid
#ENDFUNC

func _on_visible_on_screen_notifier_2d_screen_exited():
	self.queue_free()
	pass # Replace with function body.
#ENDFUNC
