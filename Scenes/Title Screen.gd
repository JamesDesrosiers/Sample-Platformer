extends Control

export(String, FILE, "*.tscn") var first_world


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_Start_Button_pressed():
	$ColorRect.visible = true
	$Tween.interpolate_property($"ColorRect", "color", \
		Color(0,0,0,0), Color(0,0,0,1), 1, Tween.TRANS_QUAD, Tween.EASE_IN)
	$Tween.start()
	yield($Tween, "tween_completed")
	# warning-ignore:return_value_discarded
	get_tree().change_scene(first_world)


func _on_Exit_Button_pressed():
	get_tree().quit()
