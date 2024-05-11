extends Node2D

@export var dialogue_json: JSON
@onready var state = {}
# Called when the node enters the scene tree for the first time.
func _ready():
	($EzDialogue as EzDialogue).start_dialogue(dialogue_json, state)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_credits_button_pressed():
	get_tree().change_scene_to_file("res://Menus/main_menu.tscn")

func _on_ez_dialogue_dialogue_generated(response: DialogueResponse):
	$DialogueBox.add_text(response.text)
	for choice in response.choices:
		$DialogueBox.add_choice(choice)
