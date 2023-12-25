extends Control
@export var total_boost = 50


func _process(_delta):
	$CDTimer.text = str(int($Cooldown.time_left))
	$TextureButton/Count.text = str(Global.energy_batteries)
	if $Cooldown.time_left > 0:
		$ColorRect.show()
	else:
		$CDTimer.text = ""
		$ColorRect.hide()
	

func _on_texture_button_pressed():
	if Global.energy_batteries > 0:
		$Duration.start()
		Global.player_energy += total_boost
		Global.energy_batteries -= 1


func _on_duration_timeout():
	Global.player_energy -= total_boost
	$Cooldown.start()
