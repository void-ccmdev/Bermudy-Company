extends StaticBody3D
class_name Pickable

var hand_marker : Marker3D

@export var message : String = ""
@export var collision : CollisionShape3D
@export var picked : bool = false

func pickup(player : CharacterBody3D):
	collision.disabled = true
	picked = true
	hand_marker = player.hand_marker

func _process(_delta: float) -> void:
	if picked == true:
		var ts = get_tree().create_tween()
		ts.tween_property(self, "global_transform", hand_marker.global_transform, 0.05)
