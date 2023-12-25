extends Control
@export var recovery = 5


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$TextureButton/Count.text = str(Global.recovery_modules)
	$CDTimer.text = str(int($CooldownTimer.time_left))
	if $CooldownTimer.time_left == 0:
		$CDTimer.text = ""

func _on_texture_button_pressed():
	if Global.recovery_modules > 0:
		Global.recovery_modules -= 1
		$RecoveryTimer.start()
		$DurationTimer.start()
	

func _on_duration_timer_timeout():
	$CooldownTimer.start()
	$RecoveryTimer.stop()
	pass # Replace with function body.


func _on_recovery_timer_timeout():
	if Global.player_health < Global.player_maxHP:
		Global.player_health += recovery
		pass # Replace with function body.
