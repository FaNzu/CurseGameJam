extends Area2D
func _ready():
	if Game.level_sprite_type == "flower":
		$Sprite.texture = load("res://Assets/Art/Blomst.png")
	elif Game.level_sprite_type == "mosqoito":
		$Sprite.texture = load("res://Assets/Art/akandemedfarve.png")
		$Sprite.scale= Vector2(0.5, 0.5)		
	elif Game.level_sprite_type == "tadpole":
		$Sprite.texture = load("res://Assets/Art/Crate.png")
		$Sprite.scale= Vector2(0.5, 0.5)


func _on_player_collison_body_entered(body):
	if body.name == "FetchPlayer":
		body.position = Vector2(50,350)
		#passc
	if body.name == "FetchPlayer2":
		body.position = Vector2(1150,350)
		#pass
