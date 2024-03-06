extends Node3D
class_name CameraShaker

# Noise-based camera shaking node.

# Credit to: https://shaggydev.com/2022/02/23/screen-shake-godot/
# Also see: https://kidscancode.org/godot_recipes/3.x/2d/screen_shake/index.html

var shake_preset: CameraShakePreset

@export var camera: Camera3D

@onready var rand := RandomNumberGenerator.new()
@onready var noise := FastNoiseLite.new()

# Used to keep track of where we are in the noise
# so that we can smoothly move through it
var _noise_i: float = 0.0

var _current_shake_strength: float = 0.0


func _ready() -> void:
	rand.randomize()

	# Sets the noise type.
	noise.noise_type = FastNoiseLite.TYPE_SIMPLEX
	# Randomize the generated noise
	noise.seed = rand.randi()
	# Frequency affects how quickly the noise changes values
	# The higher frequency is, the more rapid the changes.
	noise.frequency = 1.0/2.0


func change_preset(new_preset: CameraShakePreset):
	shake_preset = new_preset


func apply_noise_shake() -> void:
	_current_shake_strength = shake_preset.strength


func apply_preset_shake(preset: CameraShakePreset) -> void:
	shake_preset = preset
	_current_shake_strength = shake_preset.strength



func _process(delta: float) -> void:
	if not shake_preset:
		return

	# Fade out the intensity over time
	_current_shake_strength = lerp(_current_shake_strength, 0.0, shake_preset.decay_rate * delta)

	var noise_offset: Vector2 = get_noise_offset(delta)

	camera.h_offset = noise_offset.x
	camera.v_offset = noise_offset.y


func get_noise_offset(delta: float) -> Vector2:
	_noise_i += delta * shake_preset.volatility
	# Set the x values of each call to 'get_noise_2d' to a different value
	# so that our x and y vectors will be reading from unrelated areas of noise
	return Vector2(
		noise.get_noise_2d(1, _noise_i) * _current_shake_strength,
		noise.get_noise_2d(100, _noise_i) * _current_shake_strength,
	)
