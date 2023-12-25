extends Control

	
func _process(_delta):
	$Count.text = str(Global.energy_recovery)
	$CDTimer.text = str(int($Cooldown.time_left))
	if $Cooldown.time_left > 0:
		$ColorRect.show()
	else:
		$CDTimer.text = ""
		$ColorRect.hide()
	


func _on_texture_button_pressed():
	var main = $"../../../"
	var energy_timer = main.get_node("EnergyTimer")
	if Global.energy_recovery > 0:
		energy_timer.wait_time = 0.05
		Global.energy_recovery -= 1
		$Duration.start()


func _on_duration_timeout():
	var main = $"../../../"
	var energy_timer = main.get_node("EnergyTimer")
	energy_timer.wait_time = 0.1
	$Cooldown.start()
