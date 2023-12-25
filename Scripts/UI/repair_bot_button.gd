extends Control
func _process(_delta):
	$TextureButton/Count.text = str(Global.repair_bots)
	

func _on_texture_button_pressed():
	if Global.player_health < Global.player_maxHP:
		if Global.repair_bots > 0:
			Global.repair_bots -= 1
			Global.player_health = Global.player_maxHP
		
