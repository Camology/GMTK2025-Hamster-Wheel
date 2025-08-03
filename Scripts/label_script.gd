extends Label


func _ready():
	setLabelText(GlobalVariables.speed)
	GlobalVariables.changed_speed.connect(onSpeedChanged) 


func onSpeedChanged(newValue):
	setLabelText(newValue)
	
func setLabelText(textVal):
	text = "CURRENT SPEED: %s" %textVal
