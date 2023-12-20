extends Node2D
@export var image : Sprite2D 
@export var health : int
@export var rank : int
var current_pos
var random_number = 0
@onready var main = $"../../"

func _process(_delta):
	current_pos = position
	move(current_pos)
	if health <= 0:
		self.queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited():
	random_number = randi_range(100, 1820)
	health = 100
	position = Vector2(random_number, 0)

func _on_area_2d_area_entered(_body):
	pass

func flash_red():
	var tween = get_tree().create_tween()#create a tween, and flash red
	tween.tween_property($Ship, "modulate", Color.RED, .075)
	tween.tween_property($Ship, "modulate",Color.WHITE, .075)
	tween.tween_property($Ship, "modulate", Color.RED, .075)
	tween.tween_property($Ship, "modulate",Color.WHITE, .075)
	tween.tween_property($Ship, "modulate", Color.RED, .075)
	tween.tween_property($Ship, "modulate",Color.WHITE, .075)

func move(current_position):
	look_at(main.player_pos)
	position += Vector2(0, 80 * get_process_delta_time())
	if position.y > 200:
		position = current_position
		if random_number % 2 == 0:
			position += Vector2(80 * get_process_delta_time(), 0)
		else:
			position -= Vector2(80 * get_process_delta_time(), 0) 
