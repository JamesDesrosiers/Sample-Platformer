#WorldComplete.gd
extends Area2D

export(String, FILE, "*.tscn") var next_world

# warning-ignore:unused_argument
func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	
	for body in bodies:
		if body.name == "Player":
		# warning-ignore:return_value_discarded
			get_tree().change_scene(next_world)
	
