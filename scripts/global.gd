extends Node

const DEFAULT_SENSITIVITY : float = 0.005
var game_sensitivity : float = DEFAULT_SENSITIVITY

func _unhandled_input(_event: InputEvent) -> void:
    if Input.is_action_just_pressed("exit_debug"):
        get_tree().quit()