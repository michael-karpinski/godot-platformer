extends Node2D

func _physics_process(delta):
	if Input.is_action_pressed('quit'):
		get_tree().quit()
	if Input.is_action_pressed('restart'):
		get_tree().reload_current_scene()