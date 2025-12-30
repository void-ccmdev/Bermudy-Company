extends RayCast3D

@export var ui_obj_message : Label
@export var hand_marker : Marker3D
@export var player : CharacterBody3D 

var collider = null

func _process(_delta: float) -> void:
	if self.is_colliding() && self.get_collider().is_in_group("Interactable"):
		collider = self.get_collider()

		ui_obj_message.text = collider.message

		if Input.is_action_just_pressed("interact"):

			if collider is Pickable:
				collider.pickup(player)
				player.current_picked_obj = collider
		 
			if collider is Actionable:
				collider.interact(player)
	else:
		collider = null
		ui_obj_message.text = ""
