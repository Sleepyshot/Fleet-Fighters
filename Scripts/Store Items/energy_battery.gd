extends Control
@export var cost = 1000
const battery_button_scene = preload("res://Scenes/UI/energy_battery_button.tscn")

func _process(_delta):
	if $TextureButton.is_hovered():
		$ToolTip.show()
	else:
		$ToolTip.hide()

func _on_texture_button_pressed():
	var main_scene = $"../../../../"
	var HUD = main_scene.get_node("HUD")
	var Button_holder = HUD.get_node("BatteryButtonHolder")
	if Global.player_coins >= cost:
		Global.player_coins -= cost
	if Button_holder.get_child_count() == 0:
		var battery_button = battery_button_scene.instantiate()
		Button_holder.add_child(battery_button)
		Global.energy_batteries += 1
		pass
	else:
		Global.energy_batteries += 1
		pass
	
