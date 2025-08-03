extends Control

@export var layer1: CanvasLayer
@export var layer2: CanvasLayer


func _on_button_pressed() -> void:
	pass # Replace with function body.


func _on_button1_pressed() -> void:
	layer1.visible = false
	layer2.visible = true


func _on_button2_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/BaseGameScene.tscn")
