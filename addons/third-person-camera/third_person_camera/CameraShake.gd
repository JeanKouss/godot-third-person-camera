extends Node3D
class_name CameraShaker

# Noise-based camera shaking component.

# Credit to: https://shaggydev.com/2022/02/23/screen-shake-godot/
# Also see: https://kidscancode.org/godot_recipes/3.x/2d/screen_shake/index.html

# How quickly to move through the noise
var volatility: float
# Noise returns values in the range (-1, 1)
# So this is how much to multiply the returned value by
var strength: float
# Multiplier for lerping the shake strength to zero
var decay_rate: float

@export var camera: Camera3D

@onready var rand := RandomNumberGenerator.new()
@onready var noise := FastNoiseLite.new()

# Used to keep track of where we are in the noise
# so that we can smoothly move through it
var noise_i: float = 0.0

var current_shake_strength: float = 0.0


func _ready() -> void:
	rand.randomize()

	# Sets the noise type.
	noise.noise_type = FastNoiseLite.TYPE_SIMPLEX
	# Randomize the generated noise
	noise.seed = rand.randi()
	# Frequency affects how quickly the noise changes values
	# The higher frequency is, the more rapid the changes.
	noise.frequency = 1.0/2.0


func apply_noise_shake() -> void:
	current_shake_strength = strength


func _process(delta: float) -> void:
	# Fade out the intensity over time
	current_shake_strength = lerp(current_shake_strength, 0.0, decay_rate * delta)

	var noise_offset: Vector2 = get_noise_offset(delta)

	camera.h_offset = noise_offset.x
	camera.v_offset = noise_offset.y


func get_noise_offset(delta: float) -> Vector2:
	noise_i += delta * volatility
	# Set the x values of each call to 'get_noise_2d' to a different value
	# so that our x and y vectors will be reading from unrelated areas of noise
	return Vector2(
		noise.get_noise_2d(1, noise_i) * current_shake_strength,
		noise.get_noise_2d(100, noise_i) * current_shake_strength,
	)
