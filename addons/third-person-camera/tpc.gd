@tool
extends EditorPlugin

var editor_selection = EditorInterface.get_selection()

var preview_menu
var AUTOLOAD_NAME = "TpcAutoload"

func _enter_tree():
	# Adding an autoload singleton
	add_autoload_singleton(AUTOLOAD_NAME, "res://addons/third-person-camera/autoloads/TPCAutoload.gd")
	# Adding preview menu button
	preview_menu = preload("res://addons/third-person-camera/docks/Preview.tscn").instantiate()
	add_control_to_container(EditorPlugin.CONTAINER_SPATIAL_EDITOR_MENU, preview_menu)
	# Adding tpc selection listener
	update_preview_menu_visibility()
	editor_selection.selection_changed.connect(update_preview_menu_visibility)

func _exit_tree():
	# Removing preview menu button
	remove_control_from_container(EditorPlugin.CONTAINER_SPATIAL_EDITOR_MENU, preview_menu)
	preview_menu.free()
	# Removing autoload singleton
	remove_autoload_singleton(AUTOLOAD_NAME)
	pass

func update_preview_menu_visibility() :
	for node in editor_selection.get_selected_nodes() :
		if node is ThirdPersonCamera :
			preview_menu.visible = true
			return
	preview_menu.visible = false
	
