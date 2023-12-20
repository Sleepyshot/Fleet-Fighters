extends Sprite2D

func _ready():
	$AnimationPlayer.play("Explode")# play the animation
	await get_tree().create_timer(1.0).timeout# wait for the animation to complete
	self.queue_free()# remove this node
#ENDFUNC

