extends Control

const reinforcement_button_scene = preload("res://Scenes/UI/nano_reinforcment_button.tscn")
@export var cost = 1000

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
	var Button_holder = HUD.get_node("ReinforcementButtonHolder")
	if Global.player_coins >= cost:
		Global.player_coins -= cost
		if Button_holder.get_child_count() == 0:
			var reinforcement_button = reinforcement_button_scene.instantiate()
			Button_holder.add_child(reinforcement_button)
			Global.nano_reinforcement += 1
		else:
			Global.nano_reinforcement += 1
