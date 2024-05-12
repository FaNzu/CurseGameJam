extends Area2D

func _ready():
	if Game.level_sprite_type == "flower":
		$Sprite.texture = load("res://Assets/Art/Blomst.png")
	elif Game.level_sprite_type == "mosqoito":
		$Sprite.texture = load("res://Assets/Art/Onkel myg.png")
		$Sprite.scale= Vector2(0.5, 0.5)		
	elif Game.level_sprite_type == "tadpole":
		$Sprite.texture = load("res://Assets/Art/Tadpole normal.png")
		$Sprite.scale= Vector2(0.05, 0.05)
	elif Game.level_sprite_type == "snake":
		$Sprite.texture = load("res://Assets/Art/Snakehead.png")
		$Sprite.scale= Vector2(0.05, 0.05)
	elif Game.level_sprite_type == "frog":
		$Sprite.texture = load("res://Assets/Art/Frogfam1.png")
		$Sprite.scale= Vector2(0.05, 0.05)


func _on_player_collison_body_entered(body):
	if body.name == "FetchPlayer":
		body.position = Vector2(50,350)
		#passc
	if body.name == "FetchPlayer2":
		body.position = Vector2(1150,350)
		#pass
