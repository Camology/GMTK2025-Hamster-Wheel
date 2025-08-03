extends Node3D

var speed = 0.8

func _process(delta):
	#rotate_x(rotation.x-1)
	rotation.z += PI * delta * GlobalVariables.speed
	
