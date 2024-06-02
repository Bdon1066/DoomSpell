extends CharacterBody3D

@onready var animated_sprite_2d = $CanvasLayer/GunBase/AnimatedSprite2D
@onready var ray_cast_3d = $RayCast3D

const SPEED = 5.0
func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
func _input(event):
	if event is InputEventMouseMotion:
		rotation_degrees.y -= event.relative.x

func _process(delta):
	if Input.is_action_just_pressed("escape"):
		get_tree().quit()
		
func _physics_process(delta):
	var input_dir = Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
