extends Control
@onready var main = $"../"# get the root NODE

func _on_resume_pressed():
	main.pause_menu()# call the pause_menu method from the root NODE
#ENDFUNC

func _on_options_pressed():
	print("success")
#ENDFUNC

func _on_exit_pressed():
	get_tree().quit()# END EVERYTHING
#ENDFUNC
