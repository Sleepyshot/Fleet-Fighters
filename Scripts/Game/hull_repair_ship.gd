extends Node2D

func _process(_delta):
	if Global.is_paused:
		$PopupMenu.hide()
	
		
func _on_shop_trigger_area_entered(_area):
	$PopupMenu.show()
	$PopupMenu.global_position = Vector2(958, 847)
	pass # Replace with function body.


func _on_shop_trigger_area_exited(_area):
	$PopupMenu.hide()
