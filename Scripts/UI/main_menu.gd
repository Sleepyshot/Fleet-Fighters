extends Control
@onready var transition = $AnimationPlayer

func _ready():
	if Global.stages_completed == 0:
		#Instantiate the Tutorial Level
		pass
	else:
		#Move player to the store level
		pass
	$AnimationPlayer.play("fade_in")
	

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

