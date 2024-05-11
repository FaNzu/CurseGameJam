extends CharacterBody2D


const SPEED = 500.0


func _physics_process(delta):

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	input_vector.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	input_vector = input_vector.normalized()
	
	position.x = clamp(position.x, 0, 1200)
	position.y = clamp(position.y, 0, 750)
	
	velocity = velocity.move_toward(input_vector * SPEED, 300 * delta)

	move_and_slide()
