extends CharacterBody3D

@export var move_speed = 2.0

@onready var player : CharacterBody3D = get_tree().get_first_node_in_group("player")
func _physics_process(delta):
	if player == null:
		return 
	var dir = (player.global_position - global_position).normalized()
	dir.y = 0.0
	
	velocity = dir * move_speed
	move_and_slide()
	
