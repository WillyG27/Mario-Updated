extends KinematicBody2D

var rng = 0



func _process(delta):
	randomize()
	rng = rand_range(-200.0, 200.0)
	translate(Vector2(rng,rng)*delta)
