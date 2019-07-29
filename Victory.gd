extends Control

func _process(delta):
	if Input.is_action_pressed('restart'):
		get_tree().change_scene('res://Level1.tscn')
	if Input.is_action_pressed('quit'):
		get_tree().quit()