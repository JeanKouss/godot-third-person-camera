@tool
extends EditorPlugin

var preview_menu
var AUTOLOAD_NAME = "TpcAutoload"

func _enter_tree():
	# Adding an autoload singleton
	add_autoload_singleton(AUTOLOAD_NAME, "res://addons/third-person-camera/autoloads/TPCAutoload.gd")
	# Adding preview menu button
	preview_menu = preload("res://addons/third-person-camera/docks/Preview.tscn").instantiate()
	add_control_to_container(EditorPlugin.CONTAINER_SPATIAL_EDITOR_MENU, preview_menu)
	


func _exit_tree():
	# Removing preview menu button
	remove_control_from_container(EditorPlugin.CONTAINER_SPATIAL_EDITOR_MENU, preview_menu)
	preview_menu.free()
	# Removing autoload singleton
	remove_autoload_singleton(AUTOLOAD_NAME)
	pass
