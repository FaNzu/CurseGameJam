extends Node2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$CenterObject/CenterPoint.rotation += 0.6 * delta
