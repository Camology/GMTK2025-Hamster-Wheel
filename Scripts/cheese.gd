extends Node3D

@export var collision_area: Area3D
@export var munch_audio: AudioStreamPlayer

	
func _process(delta):
	rotate_y(1 * delta)
	
func _physics_process(delta: float) -> void:
	var collided = (collision_area.get_overlapping_areas())
	
	for collision in collided:
		if collision.name == "SpawnArea3D":
			queue_free()
		if collision.name == "PlayerArea3D":
			if munch_audio.playing == false:
				munch_audio.play(0.0)
				GlobalVariables.speed += 0.1
				visible = false
				await munch_audio.finished
				queue_free()
