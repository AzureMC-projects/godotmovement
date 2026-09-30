extends CharacterBody3D
class_name MovementPlayer

@export_category("Movement")
@export var walk_speed: float = 5.0
@export var acceleration: float = 18.0
@export var air_acceleration: float = 6.0
@export var gravity: float = 18.0

@export_category("Mouse Look")
@export var mouse_sensitivity: float = 0.0025
@export var min_pitch: float = -89.0
@export var max_pitch: float = 89.0

@onready var neck: Node3D = $Neck

var pitch := 0.0

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		rotate_y(-event.relative.x * mouse_sensitivity)
		pitch = clamp(
			pitch - event.relative.y * mouse_sensitivity,
			deg_to_rad(min_pitch),
			deg_to_rad(max_pitch)
		)
		neck.rotation.x = pitch

	if event is InputEventKey and event.pressed and event.keycode == KEY_ESCAPE:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _physics_process(delta: float) -> void:
	var input_2d := Input.get_vector(
		"move_left", "move_right", "move_forward", "move_backward"
	)
	var wish_dir := (transform.basis * Vector3(input_2d.x, 0.0, input_2d.y)).normalized()

	var target_velocity := wish_dir * walk_speed
	var accel := acceleration if is_on_floor() else air_acceleration

	velocity.x = move_toward(velocity.x, target_velocity.x, accel * delta)
	velocity.z = move_toward(velocity.z, target_velocity.z, accel * delta)

	if not is_on_floor():
		velocity.y -= gravity * delta
	else:
		velocity.y = 0.0

	move_and_slide()
