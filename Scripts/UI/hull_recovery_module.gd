extends Control
@export var cost = 1000
const recovery_module_scene = preload("res://Scenes/UI/hull_recovery_button.tscn")

func _ready():
	$Coin/AnimationPlayer.play("spin_coin")
	
func _process(_delta):
	if $TextureButton.is_hovered():
		$ToolTip.show()
	else:
		$ToolTip.hide()


func _on_texture_button_pressed():
	var main_scene = $"../../../../"
	var HUD = main_scene.get_node("HUD")
	var button_holder = HUD.get_node("RecoveryButtonHolder")
	if Global.player_coins >= cost:
		Global.player_coins -= cost
		if button_holder.get_child_count() == 0:
			var recovery_module = recovery_module_scene.instantiate()
			button_holder.add_child(recovery_module)
			Global.recovery_modules += 1
		else:
			Global.recovery_modules += 1
		
