extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$ProgressBar.get("theme_override_styles/fill").bg_color = Color.CHARTREUSE
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
