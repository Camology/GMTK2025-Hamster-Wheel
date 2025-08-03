extends Node3D

func _process(delta):
	#rotate_x(rotation.x-1)
	rotation.x += PI * delta * GlobalVariables.speed
