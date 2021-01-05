extends Control

export(String, FILE, "*.tscn") var Main_Menu = ""

func _on_TextureButton_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene(Main_Menu)
