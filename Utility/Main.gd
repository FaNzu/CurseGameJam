extends Node

@export var dialogue_json: JSON
@export var sprites := "eyes"
var state = {
	"player_name" : "",
	"level" : 0,
	"sprite_location" : Vector2.ZERO,
	"level_sprite_type" : ""
}
var loaded = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$DialogueBox.show()
	state["player_name"] = Game.playerName
	state["level"] = Game.level
	state["sprite_location"] = Game.sprite_location
	state["level_sprite_type"] = Game.level_sprite_type
	$Pods/Frog.position = Game.sprite_location
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
		state[variable_name] = int(variable_value)
		if variable_name == "level":
			Game.level = int(variable_value)
		elif variable_name == "level_sprite_type":
			Game.level_sprite_type = variable_value
		elif variable_name == "mentality":
			Game.mentality += int(variable_value)
			$MentalityMeter/ProgressBar.value += int(variable_value)
	if params[0] == "setvector":
		var variable_name = params[1]
		var variable_valuex = params[2]
		var variable_valuey = params[3]		
		state[variable_name] = Vector2(int(variable_valuex),int(variable_valuey))
		if variable_name == "sprite_location":
			Game.sprite_location = Vector2(int(variable_valuex),int(variable_valuey))
	if params[0] == "position":
		var variable_sprite_name = params[1]
		var variable_sprite_variable = params[2]
		get_node(variable_sprite_name).position = state[variable_sprite_variable]
	if params[0] == "diaplayer":
		var variable_sprite_name = params[1]
		if variable_sprite_name == "tadpole_normal":
			$DialogueBox/PlayerSprite.texture = load("res://Assets/Art/Tadpole normal.png")
		elif variable_sprite_name == "tadpole_cursed":
			$DialogueBox/PlayerSprite.texture = load("res://Assets/Art/tadpole curse.png")
		elif variable_sprite_name == "tadpole_happy":
			$DialogueBox/PlayerSprite.texture = load("res://Assets/Art/Tadpole happy2.png")
		elif variable_sprite_name == "frog_normal":
			$DialogueBox/PlayerSprite.texture = load("res://Assets/Art/Frogfam1.png")
			$DialogueBox/PlayerSprite.flip_h = true
			$DialogueBox/PlayerSprite.rotate(-45)
	if params[0] == "diaNPC":
		var variable_sprite_name = params[1]
		if variable_sprite_name == "Grandpa":
			$DialogueBox/Sobreo.show()
			$DialogueBox/CutsceneNPC.texture = load("res://Assets/Art/Bestefarsvigerfør.png")
			$DialogueBox/CutsceneNPC.scale = Vector2(float(params[2]),float(params[3]))
		elif variable_sprite_name == "UncleMosqioto":
			$DialogueBox/Sobreo.hide()
			$DialogueBox/CutsceneNPC.texture = load("res://Assets/Art/Onkel myg.png")
			$DialogueBox/CutsceneNPC.scale = Vector2(float(params[2]),float(params[3]))
		elif variable_sprite_name == "Snake":
			$DialogueBox/Sobreo.hide()
			$DialogueBox/CutsceneNPC.texture = load("res://Assets/Art/Snakehead.png")
			$DialogueBox/CutsceneNPC.scale = Vector2(float(params[2]),float(params[3]))
		elif variable_sprite_name == "Beetle":
			$DialogueBox/Sobreo.hide()
			$DialogueBox/CutsceneNPC.texture = load("res://Assets/Art/Bille.png")
			$DialogueBox/CutsceneNPC.scale = Vector2(float(params[2]),float(params[3]))

func _on_ez_dialogue_end_of_dialogue_reached():
	$DialogueBox.hide()
	$BoardCharacters.show()
	$Button.show()
	$DialogueBox.is_dialogue_done = true


func _on_button_pressed():
	$DialogueBox.Start_level()
