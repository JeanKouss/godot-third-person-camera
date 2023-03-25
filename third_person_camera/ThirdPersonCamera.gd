@tool
extends Node3D

@onready var _camera := $Camera
@onready var _camera_rotation_pivot = $RotationPivot
@onready var _camera_offset_pivot = $RotationPivot/OffsetPivot
@onready var _camera_spring_arm := $RotationPivot/OffsetPivot/CameraSpringArm
@onready var _camera_marker := $RotationPivot/OffsetPivot/CameraSpringArm/CameraMarker

@export var distance_from_pivot := 10.0

@export var pivot_offset := Vector2.ZERO 

@export_range(-90.0, 90.0) var initial_dive_angle_deg := -20.0 :
	get :
		return initial_dive_angle_deg
	set(value) :
		initial_dive_angle_deg = clampf(value, tilt_lower_limit_deg, tilt_upper_limit_deg)


@export_range(-90.0, 90.0) var tilt_upper_limit_deg := 60.0
@export_range(-90.0, 90.0) var tilt_lower_limit_deg := -60.0

@export_range(1.0, 100.0) var tilt_sensitiveness := 10.0
@export_range(1.0, 100.0) var horizontal_rotation_sensitiveness := 100.0



var camera_tilt_deg := 0.0
var camera_horizontal_rotation_deg := 0.0


func _process(delta):
	if Engine.is_editor_hint() :
		pass
	_camera.global_position = _camera_marker.global_position
	_camera_spring_arm.spring_length = distance_from_pivot
	_camera_offset_pivot.global_position = _camera_offset_pivot.get_parent().global_position + Vector3(pivot_offset.x, pivot_offset.y, 0.0)
	_camera_rotation_pivot.global_rotation_degrees.x = initial_dive_angle_deg
	process_tilt_input()
	process_horizontal_rotation_input()
	update_camera_tilt()
	update_camera_horizontal_rotation()




func process_horizontal_rotation_input() :
	if InputMap.has_action("tp_camera_right") and InputMap.has_action("tp_camera_left") :
		var camera_horizontal_rotation_variation = Input.get_action_strength("tp_camera_right") -  Input.get_action_strength("tp_camera_left")
		camera_horizontal_rotation_variation = camera_horizontal_rotation_variation * get_process_delta_time() * horizontal_rotation_sensitiveness
		camera_horizontal_rotation_deg += camera_horizontal_rotation_variation


func process_tilt_input() :
	if InputMap.has_action("tp_camera_up") and InputMap.has_action("tp_camera_down") :
		var tilt_variation = Input.get_action_strength("tp_camera_up") -  Input.get_action_strength("tp_camera_down")
		tilt_variation = tilt_variation * get_process_delta_time() * tilt_sensitiveness
		camera_tilt_deg = clamp(camera_tilt_deg + tilt_variation, tilt_lower_limit_deg - initial_dive_angle_deg, tilt_upper_limit_deg - initial_dive_angle_deg)
	


func update_camera_tilt() :
	_camera.global_rotation_degrees.x = clampf(initial_dive_angle_deg + camera_tilt_deg, tilt_lower_limit_deg, tilt_upper_limit_deg)

func update_camera_horizontal_rotation() :
	# TODO : inverse
	_camera_rotation_pivot.global_rotation_degrees.y = camera_horizontal_rotation_deg * -1
	_camera.global_rotation_degrees.y = camera_horizontal_rotation_deg * -1
