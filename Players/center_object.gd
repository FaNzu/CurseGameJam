extends Node2D

@export var player1Center := false
@export var player2Center := false
var basiclevel = [Vector2(-222,-115),Vector2(-120,-196), Vector2(75,-151), Vector2(-32,161), Vector2(0,220)]

func _ready():
	$Sprite2D2.texture = load("res://Assets/Art/Bille.png")
	if Game.fetch_center_sprite == "beetle":
		$Sprite2D2.texture = load("res://Assets/Art/Bille.png")
		$Sprite2D2.scale = Vector2(0.4,0.4)
		$Sprite2D2.rotate(deg_to_rad(180))
	elif Game.fetch_center_sprite == "mosqioto":
		$Sprite2D2.texture = load("res://Assets/Art/Onkel myg.png")
		$Sprite2D2.scale = Vector2(0.235,0.235)
	for objects in basiclevel:
		var mob = get_node("res://Players/floating_object.tscn").instantiate()
		mob.position = objects
		mob.scale = Vector2(0.2,0.2)

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
