extends KinematicBody2D

export var movement_range = 300
export var gravity = 750
export var speed = 250
export var jump_force = 500
var velocity = Vector2()
var horizontal_movement = speed

onready var origin = get_position().x

func _physics_process(delta):
	velocity.y += delta * gravity
	velocity.x = horizontal_movement
	move()
	if is_on_floor():
		jump()
	if is_on_ceiling():
		velocity.y = gravity * delta
	if is_on_wall():
		horizontal_movement = -horizontal_movement
		velocity.x = horizontal_movement
	move_and_slide(velocity, Vector2(0, -1))

func move():
	if get_position().x > origin + movement_range:
		horizontal_movement = -speed
	if get_position().x < origin - movement_range:
		horizontal_movement = speed

func jump():
	velocity.y = -jump_force
