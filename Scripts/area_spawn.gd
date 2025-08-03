extends Area3D

var lanes = [-2,0,2]
var startz: float = -50.0
@export var wheel_node: Node3D

func _process(delta):
	if $Pivot.get_child_count() <= 0:
		refill()

func refill():
	var lanes_available = lanes.duplicate()
	
	var cheese_scene = load("res://Scenes/cheese_powerup.tscn")
	var hazard_scene = load("res://Scenes/hazard.tscn")
	
	for i in range(0,3):
		if lanes_available.size() > 0:
			var spawn_type = randi_range(0,1)
			if spawn_type == 1:
				var cheese_instance = cheese_scene.instantiate()
				$Pivot.add_child(cheese_instance)
				var lane = lanes_available.pick_random()
				lanes_available.erase(lane)
				cheese_instance.global_transform.origin = Vector3(
					lane,
					1.0,
					1.5
				)
			else: 
				var hazard_instance = hazard_scene.instantiate()
				$Pivot.add_child(hazard_instance)
				var lane = lanes_available.pick_random()
				lanes_available.erase(lane)
				hazard_instance.global_transform.origin = Vector3(
					lane,
					1.0,
					1.5
				)	
