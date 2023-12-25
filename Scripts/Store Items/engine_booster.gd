extends Control
@export var cost = 1000
const engine_button_scene = preload("res://Scenes/UI/engine_booster_button.tscn")
func _process(_delta):
	if $TextureButton.is_hovered():
		$ToolTip.show()
	else:
		$ToolTip.hide()
func _ready():
	$Coin/AnimationPlayer.play("spin_coin")

func _on_texture_button_pressed():
	var main_scene = $"../../../../"
	var HUD = main_scene.get_node("HUD")
	var Button_holder = HUD.get_node("EngineButtonHolder")
	
	if Global.player_coins >= cost:
		Global.player_coins -= cost
		
		if Button_holder.get_child_count() == 0:
			var engine_booster = engine_button_scene.instantiate()
			Button_holder.add_child(engine_booster)
			Global.engine_boosters += 1
		else:
			Global.engine_boosters += 1
