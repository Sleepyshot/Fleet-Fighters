extends Control
@export var cost = 1000
const recovery_booster_scene = preload("res://Scenes/UI/energy_recovery_button.tscn")
func _ready():
	$Coin/AnimationPlayer.play("spin_coin")

func _process(_delta):
	if $TextureButton.is_hovered():
		$ToolTip.show()
	else:
		$ToolTip.hide()

func _on_texture_button_pressed():
	if Global.player_coins >= cost:
		Global.player_coins -= cost
		var main_scene = $"../../../../"
		var HUD = main_scene.get_node("HUD")
		var Button_holder = HUD.get_node("EnergyRecoverButtonHolder")
		if Button_holder.get_child_count() == 0:
			var recovery_booster = recovery_booster_scene.instantiate()
			Button_holder.add_child(recovery_booster)
			Global.energy_recovery += 1
		else: 
			Global.energy_recovery += 1

