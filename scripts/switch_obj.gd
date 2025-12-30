extends StaticBody3D
class_name Actionable

@export var message : String = ""
@export var target_object : Node3D
@export var needs_key : bool = false
@export var key_needed : StaticBody3D

func interact(player :CharacterBody3D):
	if needs_key:
		message = "Need Key"
		
		if player.current_picked_obj == null:
			return
		if player.current_picked_obj.name != key_needed.name:
			return
		
		player.current_picked_obj.queue_free()
	
	message = "Interact"
	needs_key = false
	target_object.action()
