extends RigidBody3D

@export var speed = 10

@onready var camera : ThirdPersonCamera = $ThirdPersonCamera


func _physics_process(_delta):
	if Input.is_action_pressed("front") :
		var dir = camera.get_front_direction()
		apply_central_force(dir * speed)
	if Input.is_action_pressed("back") :
		var dir = camera.get_back_direction()
		apply_central_force(dir * speed)
	if Input.is_action_pressed("left") :
		var dir = camera.get_left_direction()
		apply_central_force(dir * speed)
	if Input.is_action_pressed("right") :
		var dir = camera.get_right_direction()
		apply_central_force(dir * speed)


