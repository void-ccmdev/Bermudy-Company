extends Node3D

@export var sea_anim_player : AnimationPlayer

func _ready() -> void:
	sea_anim_player.play("WaterMain")