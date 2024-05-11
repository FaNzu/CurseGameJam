extends Node2D

@export var player1Center := false
@export var player2Center := false

func _on_right_body_entered(body):
	if body.name == "FetchPlayer":
		player1Center = true

func _on_right_body_exited(body):
	if body.name == "FetchPlayer1":
		player1Center = false

func _on_left_body_entered(body):
	if body.name == "FetchPlayer2":
		player2Center = true

func _on_left_body_exited(body):
	if body.name == "FetchPlayer2":
		player2Center = false

func _physics_process(delta):
	if player1Center and player2Center:
		print("YOU WIN")
		get_tree().change_scene_to_file("res://Menus/pond.tscn")
