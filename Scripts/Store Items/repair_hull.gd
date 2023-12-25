extends Control

func _on_texture_button_pressed():
	if Global.player_health < Global.player_maxHP:
		Global.player_health = Global.player_maxHP
		
func _ready():
	$Coin/AnimationPlayer.play("spin_coin")
	$Coin/TotalCoins.text = "0"
