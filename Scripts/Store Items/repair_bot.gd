extends Control
@export var cost = 1000

const repair_button_scene = preload("res://Scenes/UI/repair_bot_button.tscn")
func _process(_delta):
	if $TextureButton.is_hovered():
		$ToolTip.show()
	else:
		$ToolTip.hide()

func _ready():
	$Coin/AnimationPlayer.play("spin_coin")
	$Coin/TotalCoins.text = str(cost)
	$ToolTip/ItemImage.apply_scale(Vector2(.75, .75)) 
	$ToolTip/ItemImage.position += Vector2(-8, -15)

func _on_texture_button_pressed():
	var main_scene = $"../../../../"
	var HUD = main_scene.get_node("HUD")
	var Button_holder = HUD.get_node("RepairButtonHolder")
	
	if Global.player_coins >= cost:
		Global.player_coins -= cost
		if Button_holder.get_child_count() == 0:
			var repair_button = repair_button_scene.instantiate()
			Button_holder.add_child(repair_button)
			Global.repair_bots += 1
		else:
			Global.repair_bots += 1
