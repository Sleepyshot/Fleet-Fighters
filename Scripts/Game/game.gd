extends Node2D
@onready var pause_scene = $PauseMenu
@onready var HUD = $HUD

func _ready():
	$HUD/Coin/AnimationPlayer.play("spin_coin")
	
func _process(_delta):
	$HUD/CastProgress.value = Global.player_energy
	$HUD/MaxEnergy.text = str(Global.player_energy)
	$HUD/HealthProgress.value = Global.player_health
	$HUD/HealthProgress.max_value = Global.player_maxHP
	$HUD/HealthProgress/MaxHP.text = str(Global.player_maxHP)
	$HUD/Coin/TotalCoins.text = str(Global.player_coins)
	$HUD/ExpProgress.value = Global.player_exp
	
	if Input.is_action_just_pressed("Pause"):# if we press the pause button
		pause_menu()# call pause menu
#ENDFUNC
		
func pause_menu():
	if Global.is_paused:
		pause_scene.hide()
		Engine.time_scale = 1
	else:
		pause_scene.show()
		Engine.time_scale = 0
	Global.is_paused = !Global.is_paused
#ENDFUNC

func _on_energy_timer_timeout():
	if Global.player_energy < 100:
		Global.player_energy += 1

	
