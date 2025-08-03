extends CharacterBody3D

const MOVE_SPEED: float = 8.0
const LANES: Array = [-2,0,2]

var starting_point: Vector3 = Vector3.ZERO
var current_lane: int = 1
var target_lane: int = 1

@export var yummy_audio:AudioStreamPlayer 

func _ready() -> void:
	starting_point = global_transform.origin
	GlobalVariables.changed_speed_positive.connect(onSpeedChanged) 
	
func _physics_process(delta: float) -> void:
	var direction: Vector3 = Vector3.ZERO
	
	# Handle lane switching
	if Input.is_action_just_pressed("ui_right") and target_lane > 0:
		target_lane -= 1
	if Input.is_action_just_pressed("ui_left") and target_lane < LANES.size() - 1:
		target_lane += 1
		
		
# Move towards the target lane
	var target_x: float = LANES[target_lane]
	var current_x: float = global_transform.origin.x
	global_transform.origin.x = lerp(current_x, target_x, MOVE_SPEED * delta)

	# Apply the velocity and move the character
	move_and_slide()
	


func onSpeedChanged():
	if yummy_audio.playing == false:
				yummy_audio.play(0.0)
