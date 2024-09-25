@tool
extends EditorPlugin

var preview_menu

func _enter_tree():
	# Adding preview panel
	preview_menu = preload("res://addons/third-person-camera/editor_panels/Preview.tscn").instantiate()
	add_control_to_bottom_panel(preview_menu, "Third Person Camera")

func _exit_tree():
	# Removing preview panel
	remove_control_from_bottom_panel(preview_menu)
	preview_menu.free()
	
