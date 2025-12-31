extends Node3D

const NEXT_SCENE : PackedScene = preload("res://scenes/debug_map.tscn")

func _ready() -> void:
	pass

func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file(NEXT_SCENE.resource_path)


func _on_credits_button_pressed() -> void:
	pass # Replace with function body.


func _on_quit_button_pressed() -> void:
	get_tree().quit()
