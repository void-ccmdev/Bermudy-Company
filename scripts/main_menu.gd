extends Node3D

const NEXT_SCENE : PackedScene = preload("res://scenes/debug_map.tscn")

@export var fade_anim_player : AnimationPlayer
@export var water_anim_player : AnimationPlayer
@export var time_offset : float = 0.5


func _ready() -> void:
	water_anim_player.play("Water")

func _on_play_button_pressed() -> void:
	fade_anim_player.play("Fade")
	await get_tree().create_timer(fade_anim_player.current_animation_length + time_offset).timeout
	get_tree().change_scene_to_file(NEXT_SCENE.resource_path)


func _on_credits_button_pressed() -> void:
	pass # Replace with function body.


func _on_quit_button_pressed() -> void:
	fade_anim_player.play("Fade")
	await get_tree().create_timer(fade_anim_player.current_animation_length + time_offset).timeout
	get_tree().quit()
