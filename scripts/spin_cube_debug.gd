extends StaticBody3D

var time = 2.0

func action():
	var ts := get_tree().create_tween()
	ts.tween_property(self, "global_rotation", Vector3(0, self.rotation.y + 360, 0), time)