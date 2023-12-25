extends Control
@export var file_name : String
var current_index := 0

var json_as_dict
var length
func _ready():
	var file_path = "res://Data/Dialog/" + file_name + ".json"
	var json_as_text = FileAccess.get_file_as_string(file_path)
	json_as_dict = JSON.parse_string(json_as_text)
	length = json_as_dict.size()

func _process(_delta):
	if visible:
		var dialog = json_as_dict
		$Name.text = dialog[current_index]["name"]
		$Dialog.text = dialog[current_index]["text"]
		if Input.is_action_just_pressed("ui_accept") and current_index < length - 1:
			current_index += 1		
		elif Input.is_action_just_pressed("ui_accept") and current_index == length - 1:
			Global.is_paused = false
			self.hide()
