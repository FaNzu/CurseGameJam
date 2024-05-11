extends Node2D

@onready var choice_button_scn = preload("res://Utility/choice_button.tscn")
var choice_buttons: Array[Button] = []
var is_dialogue_done = false

func _ready():
	pass
	#add_choice("this is a choice number 0")
	#add_choice("this is a choice number 1")

func clear_dialogue_box():
	$VBoxContainer/Text.text = ""
	for choice in choice_buttons:
		$VBoxContainer.remove_child(choice)
	choice_buttons = []

func add_text(text: String):
	$VBoxContainer/Text.text = text
	
func add_choice(choice_text: String):
	var button_obj: choice_button = choice_button_scn.instantiate()
	button_obj.choice_index = choice_buttons.size()
	choice_buttons.push_back(button_obj)
	button_obj.text = choice_text
	button_obj.choice_selected.connect(_on_choice_selected)
	$VBoxContainer.add_child(button_obj)

func _on_choice_selected(choice_index: int):
	if !is_dialogue_done:
		($"../EzDialogue" as EzDialogue).next(choice_index)

func Start_level():
	clear_dialogue_box()
	get_tree().change_scene_to_file("res://Levels/FetchGame.tscn")
	queue_free()
