extends Control

@export var total_boost = 100


func _process(_delta):
	$CDTimer.text = str(int($Cooldown.time_left))
	$TextureButton/Count.text = str(Global.engine_boosters)
	if $Cooldown.time_left > 0:
		$ColorRect.show()
	else:
		$CDTimer.text = ""
		$ColorRect.hide()
	

func _on_texture_button_pressed():
	if Global.engine_boosters > 0:
		var main = $"../../../"
		var player = main.get_node("Player")
		player.max_speed += total_boost
		$Duration.start()
		Global.engine_boosters -= 1


func _on_duration_timeout():
	var main = $"../../../"
	var player = main.get_node("Player")
	player.max_speed -= total_boost
	$Cooldown.start()


