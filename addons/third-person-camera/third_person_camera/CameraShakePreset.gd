extends Resource
class_name CameraShakePreset

# How quickly to move through the noise.
@export var volatility: float
# Noise returns values in the range (-1, 1)
# So this is how much to multiply the returned value by
@export var strength: float
# Multiplier for lerping the shake strength to zero
@export var decay_rate: float
