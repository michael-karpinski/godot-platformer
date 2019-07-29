extends KinematicBody2D

export var gravity = 750
export var speed = 400
export var jump_force = 500
export var lives = 5

var vulnerable = true
var velocity = Vector2()

func _ready():
	update_lives_gui()

func update_lives_gui():
	$Camera2D/CanvasLayer/GUI.update_hearts(lives)

func _physics_process(delta):
	move(delta)

func move(delta):
	velocity.y += delta * gravity
	velocity.x = 0
	if Input.is_action_pressed("move_right"):
		velocity.x += speed
	if Input.is_action_pressed('move_left'):
		velocity.x -= speed
	if is_on_floor():
		jump()
	if is_on_ceiling():
		velocity.y = gravity * delta
	move_and_slide(velocity, Vector2(0, -1))

func jump(force = jump_force):
	velocity.y = -force

func take_damage(area):
	if area.name == 'Enemy_Hitbox':
		if lives > 1 and vulnerable:
			hurt_animation()
			lives -= 1
			update_lives_gui()
			jump(jump_force / 2)
		elif vulnerable:
			get_tree().reload_current_scene()

func hurt_animation():
	$AnimatedSprite.play('hurt')
	vulnerable = false
	yield(get_tree().create_timer(1), "timeout")
	$AnimatedSprite.play('default')
	vulnerable = true
