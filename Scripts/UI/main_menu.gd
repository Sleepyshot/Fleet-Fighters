extends Control
@onready var transition = $AnimationPlayer

func _ready():
	await get_tree().create_timer(.5).timeout
	$AnimationPlayer.play("fade_in")
	
	pass
func _on_play_pressed():
	transition.play("fade_out")
#ENDFUNC


func _on_exit_pressed():
	get_tree().quit()
#ENDFUNC


func _on_credits_pressed():
	pass # Replace with function body.


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "fade_out":
		get_tree().change_scene_to_file("res://Scenes/game.tscn")
		pass # Replace with function body.
