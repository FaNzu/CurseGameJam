extends Node2D
#
#@export var dialogue_json: JSON
#@onready var state = {
	#"show_only_one": false,
	#"player_name": "Frog 921",
	#"level": 0
#}
## Called when the node enters the scene tree for the first time.
#func _ready():
	#($EzDialogue as EzDialogue).start_dialogue(dialogue_json, state)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_credits_button_pressed():
	get_tree().change_scene_to_file("res://Menus/main_menu.tscn")
#
#func _on_ez_dialogue_dialogue_generated(response: DialogueResponse):
	#$DialogueBox.clear_dialogue_box()
	#
	#$DialogueBox.add_text(response.text)
	#
	#if response.choices.is_empty():
		#$DialogueBox.add_choice("...")
	#for choice in response.choices:
		#$DialogueBox.add_choice(choice)
#
#
#func _on_ez_dialogue_custom_signal_received(value):
	#var params = value.split(",")
	#if params[0] == "set":
		#var variable_name = params[1]
		#var variable_value = params[2]
		#state[variable_name] = variable_value
	#pass # Replace with function body.
#
#
#func _on_ez_dialogue_end_of_dialogue_reached():
	#$DialogueBox.is_dialogue_done = true
