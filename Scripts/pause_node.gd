extends Node
@export var pause_screen: CanvasLayer
@export var exit_button: Button
@export var pause_wallpaper: TextureRect
@export var audio: AudioStreamPlayer

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("escape-key"):
		if get_tree().paused == false:
			audio.pitch_scale = 0.8
			get_tree().paused = true
			pause_screen.visible = true
		else:
			audio.pitch_scale = 1.0
			get_tree().paused = false
			pause_screen.visible = false
			

func _physics_process(delta: float) -> void:
	exit_button.rotation += PI * delta * GlobalVariables.speed
	# Create a smooth bouncing effect between alpha values 0.06 and 0.8 (0x0f and 0xcc in 0-255 range)
	var min_alpha: float = 0.06
	var max_alpha: float = 0.8
	var speed: float = 1.5  # Adjust speed of the animation
	
	# Use sine wave to create smooth bounce between min and max alpha
	var alpha = (sin(Time.get_ticks_msec() * 0.001 * speed) * 0.5 + 0.5) * (max_alpha - min_alpha) + min_alpha
	pause_wallpaper.modulate = Color(1.0, 1.0, 1.0, alpha)

func _on_resume_pressed() -> void:
	get_tree().paused = false
	audio.pitch_scale = 1.0
	pause_screen.visible = false


func _on_quit_pressed() -> void:
	get_tree().quit()
