extends CharacterBody2D

@export var arm_index = 0
@export var ACCELERATION = 1000
@export var MAX_SPEED = 1000
@export var FRICTION = 200
@export var start_player_position = Vector2(50,350)
const screen_size = Vector2(1200,700)

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	var input_vector = Vector2.ZERO

	if arm_index == 0:
		input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
		input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
		position.x = clamp(position.x, 600, screen_size.x)
		position.y = clamp(position.y, 0, screen_size.y)
		
	if arm_index == 1:
		input_vector.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
		input_vector.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
		position.x = clamp(position.x, 0, 600)
		position.y = clamp(position.y, 0, screen_size.y)	
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)*0.8
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)



	var collision = move_and_collide(velocity * delta)
	if collision:
		print("I collided with ", collision.get_collider().name)
	
	for i in range(get_slide_collision_count()):
		print(get_slide_collision_count())
	move_and_slide()
	
