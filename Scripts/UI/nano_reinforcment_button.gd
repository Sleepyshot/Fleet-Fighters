extends Control
@export var total_boost = 25

func _process(_delta):
	$CDTimer.text = str(int($CooldownTimer.time_left))
	$TextureButton/Count.text = str(Global.nano_reinforcement)
	if $CooldownTimer.time_left == 0:
		$CDTimer.text = ""
	
func _on_texture_button_pressed():
	if Global.nano_reinforcement > 0:
		Global.nano_reinforcement -= 1
		Global.player_maxHP += total_boost
		$DurationTimer.start()


func _on_duration_timer_timeout():
	$CooldownTimer.start()
	Global.player_maxHP -= total_boost

