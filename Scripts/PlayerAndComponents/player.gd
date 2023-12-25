extends CharacterBody2D
@export var acceleration := 4.0
@export var max_speed := 250.0
@export var rotation_speed := 125.0

const bullet_scene = preload("res://Scenes/Objects/blaster_bullets.tscn")



func _process(delta):
	var input_vector := Vector2(0, Input.get_axis( "Forward", "Backward"))# get the users input
	velocity += input_vector.rotated(rotation) * acceleration
	velocity = velocity.limit_length(max_speed)
	if input_vector.y == 0:
		$Thrusters.hide()
		velocity = velocity.move_toward(Vector2.ZERO, 4.25)
	if Input.is_action_pressed("Forward") and !Global.is_paused:
		$Thrusters.show()
	if Input.is_action_pressed("RotateRight"):
		rotate(deg_to_rad(rotation_speed * delta))
	if Input.is_action_pressed("RotateLeft"):
		rotate(deg_to_rad(-rotation_speed * delta))
	if Input.is_action_just_pressed("Fire") and !Global.is_paused  and !Global.in_store:
		if check_weapon_type() == "Blasters":
		# here we need to check what our current weapon is by getting our array of strings that 
		# represent the weapon being used. This function will be called check_weapon_type()
			fire_blasters()	
	position.x = clamp(position.x, 100, 1800)# the player cannot move outside this range
	position.y = clamp(position.y, 100, 900)
	move_and_slide()
	Global.player_pos = global_position	
#ENDFUNC
	
func fire_blasters():
		var bullet1 = bullet_scene.instantiate()
		get_parent().add_child(bullet1)
		bullet1.position = $Ship/Turret1.global_position#set the position to the tip of the turret
		bullet1.rotation = rotation 
#ENDFUNC
	
func _on_area_2d_area_entered(area):
	var object_entered = area.get_parent()
	if object_entered.name == "Asteroid":
		Global.player_health -= object_entered.collision_damage
		flash_red()
	
func check_weapon_type():
	var weapon = Global.weapons[Global.current_weapon_index]
	return weapon


func flash_red():
	var tween = get_tree().create_tween()#create a tween, and flash red
	tween.tween_property($Ship, "modulate", Color.RED, .075)
	tween.tween_property($Ship, "modulate",Color.WHITE, .075)
