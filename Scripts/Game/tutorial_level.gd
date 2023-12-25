extends Node2D

@onready var controls_image = preload("res://Assets/UI/TutorialCustomDialogBox.png")
@onready var dialog_box = $DialogBox
const spawner_scene = preload("res://Scenes/Objects/asteroid_spawner.tscn")
func _ready():
	$DialogTimer.start()
	pass
	
func _process(_delta):
	if dialog_box:
		if $DialogBox.current_index == 3:
			$TutControlsImage.show()
		else:
			$TutControlsImage.hide()	
		if $DialogBox.current_index == 4:
			$Pointer.position = Vector2(570,870)
			$Pointer.show()
		elif $DialogBox.current_index == 5:
			$Pointer.position = Vector2(1370,870)
			$Pointer.show()
		else:
			$Pointer.hide()
		if !$DialogBox.current_index >= $DialogBox.length -1:
			$SpawnTimer.start()# start the asteroid spawner when this timer ends	
	if $EndDialog.current_index >= $EndDialog.length -1 and $EndDialog.visible:
		$EndTutorialTimer.start() # end the Tutorial and move to store scene
	if $EndDialog.current_index >= $EndDialog.length -1:
		pass 
	
func _on_dialog_timer_timeout():
	var tween = get_tree().create_tween()
	tween.tween_property($DialogBox, "position", Vector2(872, 511), 1.5)


func _on_spawn_timer_timeout():
	var asteroid_spawner = spawner_scene.instantiate()
	add_child(asteroid_spawner)
	$LevelTimer.start()


func _on_level_timer_timeout():
	$EndDialog.show()
	var tween = get_tree().create_tween()
	tween.tween_property($EndDialog, "position", Vector2(872, 511), 1.5)
	get_node("AsteroidSpawner").queue_free()


func _on_end_tutorial_timer_timeout():
	get_tree().change_scene_to_file("res://Scenes/UI/main_menu.tscn")#temporary redirect
	#here we will instantiate the store scene and queue_free this level
