extends CharacterBody2D
@export var acceleration := 4.0
@export var max_speed := 250.0
@export var rotation_speed := 125.0
@export var energy_cost = 10
const bullet_scene = preload("res://Scenes/blaster_bullets.tscn")
@onready var main = $"../../"


func _process(delta):
	var input_vector := Vector2(0, Input.get_axis( "Forward", "Backward"))# get the users input
	velocity += input_vector.rotated(rotation) * acceleration
	velocity = velocity.limit_length(max_speed)
	if input_vector.y == 0:
		$Thrusters.hide()
		velocity = velocity.move_toward(Vector2.ZERO, 4.25)
	if Input.is_action_pressed("Forward") and !main.is_paused:
		$Thrusters.show()
	if Input.is_action_pressed("RotateRight"):
		rotate(deg_to_rad(rotation_speed * delta))
	if Input.is_action_pressed("RotateLeft"):
		rotate(deg_to_rad(-rotation_speed * delta))
	if Input.is_action_just_pressed("Fire") and !main.is_paused and main.player_energy > energy_cost:
		fire_blasters()	
	position.x = clamp(position.x, 100, 1800)# the player cannot move outside this range
	position.y = clamp(position.y, 100, 900)
	move_and_slide()
	main.player_pos = global_position	
#ENDFUNC
	
func fire_blasters():
		main.player_energy -= energy_cost
		var bullet1 = bullet_scene.instantiate()
		get_parent().add_child(bullet1)
		bullet1.position = $Ship/Turret1.global_position#set the position to the tip of the turret
		bullet1.rotation = rotation 
#ENDFUNC
	
func _on_area_2d_area_entered(area):
	var object_entered = area.get_parent()
	if object_entered.name == "Asteroid":
		main.player_health -= object_entered.collision_damage
	var tween = get_tree().create_tween()#create a tween, and flash red
	tween.tween_property($Ship, "modulate", Color.RED, .075)
	tween.tween_property($Ship, "modulate",Color.WHITE, .075)
	tween.tween_property($Ship, "modulate", Color.RED, .075)
	tween.tween_property($Ship, "modulate",Color.WHITE, .075)
	tween.tween_property($Ship, "modulate", Color.RED, .075)
	tween.tween_property($Ship, "modulate",Color.WHITE, .075)
	pass # Replace with function body.


