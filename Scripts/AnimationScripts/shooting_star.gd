extends Node2D
@onready var main = $"../../../"

func _process(_delta):
	if main.is_paused:
		pass
	else:
		position += Vector2(-3, 3)

func _on_visible_on_screen_notifier_2d_screen_exited():
	await get_tree().create_timer(5.0).timeout
	self.queue_free()
	pass # Replace with function body.
