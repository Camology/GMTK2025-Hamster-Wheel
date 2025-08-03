extends Node3D

@export var collision_area: Area3D
@export var audio: AudioStreamPlayer

func _physics_process(delta: float) -> void:
	var collided = (collision_area.get_overlapping_areas())
	for collision in collided:
		if collision.name == "SpawnArea3D":
			queue_free()
		if collision.name == "PlayerArea3D":
			if audio.playing == false:
				audio.play(0.0)
				GlobalVariables.speed -= 0.1
				visible = false
				await audio.finished
				queue_free()
