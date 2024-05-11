extends Area2D

func _on_player_collison_body_entered(body):
	if body.name == "FetchPlayer":
		body.position = Vector2(50,350)
		#passc
	if body.name == "FetchPlayer2":
		body.position = Vector2(1150,350)
		#pass
