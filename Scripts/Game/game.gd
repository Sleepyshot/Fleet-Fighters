extends Node2D
@onready var pause_scene = $PauseMenu
@onready var HUD = $HUD

var is_paused = false
var player_pos : Vector2
var player_health : int = 100
var player_energy : int = 100
var player_exp : int = 0
var player_level : int = 1
var player_coins : int = 0
func _ready():
	$HUD/Coin/AnimationPlayer.play("spin_coin")
	
func _process(_delta):
	$HUD/CastProgress.value = player_energy
	$HUD/HealthProgress.value = player_health
	$HUD/Coin/TotalCoins.text = str(player_coins)
	if Input.is_action_just_pressed("Pause"):# if we press the pause button
		pause_menu()# call pause menu
#ENDFUNC
		
func pause_menu():
	if is_paused:
		pause_scene.hide()
		Engine.time_scale = 1
	else:
		pause_scene.show()
		Engine.time_scale = 0
	is_paused = !is_paused
#ENDFUNC

func _on_energy_timer_timeout():
	if player_energy < 100:
		player_energy += 1
	pass # Replace with function body.
