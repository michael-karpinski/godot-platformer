extends KinematicBody2D



func _on_Hitbox_area_entered(area):
	get_tree().change_scene('res://Victory.tscn')
