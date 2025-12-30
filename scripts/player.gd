extends CharacterBody3D 

const NORMAL_SPEED : float = 4.75
const SPRINT_SPEED : float = 6.5

@export var current_speed : float = NORMAL_SPEED

@export var head : Node3D
@export var camera : Camera3D
@export var hand_marker : Marker3D

@export var current_picked_obj : StaticBody3D

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	camera.top_level = true

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		self.rotate_y(-event.relative.x * Global.game_sensitivity)
		head.rotate_x(-event.relative.y * Global.game_sensitivity)
		head.rotation.x = clamp(head.rotation.x, deg_to_rad(-90), deg_to_rad(90))

	if Input.is_action_pressed("sprint"):
		current_speed = SPRINT_SPEED
	else:
		current_speed = NORMAL_SPEED

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	var input_dir := Input.get_vector("left", "right", "front", "back")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * current_speed
		velocity.z = direction.z * current_speed
	else:
		velocity.x = move_toward(velocity.x, 0, current_speed)
		velocity.z = move_toward(velocity.z, 0, current_speed)

	move_and_slide()

func _process(_delta: float) -> void:
	var ts := get_tree().create_tween()
	ts.tween_property(camera, "global_position", head.global_position, 0.25)
	camera.global_rotation = head.global_rotation
