extends Sprite2D

func _ready():
	$AnimationPlayer.play("DestroyAsteroid")# play the animation
	await get_tree().create_timer(.5).timeout# wait for the animation to complete
	self.queue_free()# remove this node
#ENDFUNC
