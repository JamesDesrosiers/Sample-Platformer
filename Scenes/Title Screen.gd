extends Control

export(String, FILE, "*.tscn") var first_world
export(String, FILE, "*.tscn") var options_menu


# Called when the node enters the scene tree for the first time.
func _ready():
	Settings.refresh_levels()
	pass # Replace with function body.


func do_fade():
	$ColorRect.visible = true
	$Tween.interpolate_property($"ColorRect", "color", \
		Color(0,0,0,0), Color(0,0,0,1), 0.3, Tween.TRANS_QUAD, Tween.EASE_IN)
	$Tween.start()

func _on_Start_Button_pressed():
	do_fade()
	yield($Tween, "tween_completed")
	# warning-ignore:return_value_discarded
	get_tree().change_scene(first_world)


func _on_Exit_Button_pressed():
	var timer = Timer.new()
	timer.wait_time = float(0.31)
	timer.one_shot = true
	self.add_child(timer)
	timer.start()
	do_fade()
	yield(timer, "timeout")
	get_tree().quit()


func _on_Option_Menu_pressed():
	do_fade()
	yield($Tween, "tween_completed")
# warning-ignore:return_value_discarded
	get_tree().change_scene(options_menu)
