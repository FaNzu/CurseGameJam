extends Node2D

func _ready():
	pass

func _on_exit_button_pressed():
	get_tree().quit()

func _on_start_button_pressed():
	#get_tree().change_scene_to_file("res://Levels/FetchGame.tscn")
	get_tree().change_scene_to_file("res://Menus/pond.tscn")
	

func _on_credits_button_pressed():
	get_tree().change_scene_to_file("res://Menus/credits.tscn")
