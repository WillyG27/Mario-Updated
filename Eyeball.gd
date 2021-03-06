extends KinematicBody2D

var velocity = Vector2()
export var direction = -1

func _ready():
	if direction == 1:
		$AnimatedSprite.flip_h = true

# warning-ignore:unused_argument
func _physics_process(delta):
	
	if is_on_wall():
		direction = direction * -1
	
	velocity.y += 20
	
	velocity.x = 50 * direction
	
	velocity = move_and_slide(velocity,Vector2.UP)
