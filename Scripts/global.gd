extends Node
var player_pos : Vector2
var player_health : int = 50
var player_maxHP := 100
var player_energy : int = 100
var player_coins : int = 10000
var player_exp : int = 0
var player_level : int = 0
var stages_completed : int = 0
var is_paused := false
var in_store := false
var repair_bots := 0
var nano_reinforcement := 0
var recovery_modules := 0
var energy_batteries := 0
var engine_boosters := 0
var energy_recovery := 0
var weapons = ["Blasters"]
var current_weapon_index := 0
func save():
	var save_dict = {
		"health": player_health,
		"energy": player_energy,
		"coin": player_coins,
		"completed": stages_completed,
		"exp" : player_exp,
		"level": player_level,
		"repairbots": repair_bots,
		"nano": nano_reinforcement,
		"recovery": recovery_modules
		
	}
	return save_dict
	
func save_game():
	var saved_game = FileAccess.open_encrypted_with_pass("user://FleetFighter.save", FileAccess.WRITE, "sleepy")
	var json_string = JSON.stringify(save())
	saved_game.store_line(json_string)

func load_game():
	if !FileAccess.file_exists("user://FleetFighter.save"):
		save_game()
	var saved_game = FileAccess.open_encrypted_with_pass("user://FleetFighter.save",FileAccess.READ, "sleepy")
	while saved_game.get_position() < saved_game.get_length():
		var json_string = saved_game.get_line()
		var json = JSON.new()
		var parse_result = json.parse(json_string)
		if not parse_result == OK:
			print("JSON Parse Error: ", json.get_error_message(), " in ", json_string, " at line ", json.get_error_line())
			continue
		var node_data = json.get_data()
	
		player_health = node_data["health"]
		player_energy = node_data["energy"]
		player_coins = node_data["coin"]
		player_exp = node_data["exp"]
		player_level = node_data["level"]
		stages_completed = node_data["completed"]
