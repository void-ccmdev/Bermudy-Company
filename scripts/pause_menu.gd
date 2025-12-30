extends Control

func _ready() -> void:
	self.hide()
	get_tree().paused = false

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("pause"):
		if get_tree().paused:
			resume()
		else:
			pause()

func pause() -> void:
	self.show()
	get_tree().paused = true
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func resume() -> void:
	self.hide()
	get_tree().paused = false
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _on_resume_pressed() -> void:
	resume()


func _on_main_menu_pressed() -> void:
	pass # Replace with function body. CHANGE CURRENT SCENE TO MAINMENU.TSCN


func _on_quit_pressed() -> void:
	get_tree().quit()


