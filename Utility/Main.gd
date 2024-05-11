extends Node

@export var dialogue_json: JSON
@onready var state = {
	"show_only_one": false,
	"player_name": "Frog 921",
	"level": 0,
	"mentality": 5,
	"mosquito_choice": false,
	"beetle_eaten": false,
	"sprite_location": Vector2(0,0)
}
@export var sprites := "eyes"

# Called when the node enters the scene tree for the first time.
func _ready():
	($EzDialogue as EzDialogue).start_dialogue(dialogue_json, state)

func _on_ez_dialogue_dialogue_generated(response: DialogueResponse):
	$DialogueBox.clear_dialogue_box()
	
	$DialogueBox.add_text(response.text)
	
	if response.choices.is_empty():
		$DialogueBox.add_choice("...")
	for choice in response.choices:
		$DialogueBox.add_choice(choice)


func _on_ez_dialogue_custom_signal_received(value):
	var params = value.split(",")
	if params[0] == "set":
		var variable_name = params[1]
		var variable_value = params[2]
		state[variable_name] = variable_value
	if params[0] == "setvector":
		var variable_name = params[1]
		var variable_valuex = params[2]
		var variable_valuey = params[3]		
		state[variable_name] = Vector2(int(variable_valuex),int(variable_valuey))
	if params[0] == "position":
		var variable_sprite_name = params[1]
		var variable_sprite_variable = params[2]
		var node = get_node(variable_sprite_name)
		print(variable_sprite_variable)
		node.position = state[variable_sprite_variable]

func _on_ez_dialogue_end_of_dialogue_reached():
	$DialogueBox.is_dialogue_done = true
