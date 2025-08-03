extends Node

signal changed_speed(new_value)
signal changed_speed_positive()
var speed:float = 0.8:
	get: 
		return speed
	set(new_value):
		changed_speed.emit(new_value)
		if (new_value > speed):
			changed_speed_positive.emit()
		speed = new_value
	
