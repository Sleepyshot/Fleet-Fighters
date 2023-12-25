extends Node2D

func _process(_delta):
	if Global.is_paused:
		$PopupMenu.hide()


func _on_area_2d_area_entered(_area):
	$PopupMenu.global_position = Vector2(958, 847)
	$PopupMenu.show()


func _on_area_2d_area_exited(_area):
	$PopupMenu.hide()

