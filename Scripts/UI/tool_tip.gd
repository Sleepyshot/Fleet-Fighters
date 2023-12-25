extends Control
@export var item_image : Texture
@export var tip : String 


func _ready():
	$ItemImage.texture = item_image
	$Tip.text = tip
