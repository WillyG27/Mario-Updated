extends KinematicBody2D

var rng = 0



func _process(delta):
	randomize()
	rng = rand_range(-1500.0, 150.0)
	translate(Vector2(rng,rng)*delta)
