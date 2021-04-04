extends KinematicBody2D

signal grounded_updated(is_grounded)

var velocity = Vector2(0,0) # This vector is determening where my floor is facing
const SPEED = 240 # This constant determines how fast the sprite moves
const JUMPFORCE = -1400
const GRAVITY = 40 # controls th speed of descent 

# warning-ignore:unused_argument
func _physics_process(delta):
	if Input.is_action_pressed("right"): # When the custom input is pressed the sprite will move right
		velocity.x= SPEED
	if Input.is_action_pressed("left"): # When the custom input is pressed the sprite will move left
		velocity.x= -SPEED
	
	
	velocity.y = velocity.y + GRAVITY # this is the y axis and controls up and down (increseses momentum of fall)
	
	if Input.is_action_just_pressed("jump") and is_on_floor(): # when the custom jump input is pressed the sprite will jump
		velocity.y = JUMPFORCE # Jump height
	
	velocity = move_and_slide(velocity,Vector2.UP)
	
	velocity.x = lerp(velocity.x,0,0.2)

	var is_grounded

	var was_grounded = is_grounded
	is_grounded = is_on_floor()

	if was_grounded == null || is_grounded != was_grounded:
		emit_signal("grounded_updated", is_grounded)

# warning-ignore:unused_argument
func _on_KinematicBody2D_grounded_updated(is_grounded):
	pass # Replace with function body.


