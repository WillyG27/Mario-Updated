extends KinematicBody2D

var speed = 50
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
	
	velocity.x = speed * direction
	
	velocity = move_and_slide(velocity,Vector2.UP)



func _on_Top_checker_body_entered(body):
	$CollisionShape2D/AnimatedSprite.play("Squish")
	speed = 0
	set_collision_layer_bit(4,false)
	set_collision_layer_bit(0,false)
