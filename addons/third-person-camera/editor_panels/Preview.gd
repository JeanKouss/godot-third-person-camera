@tool
extends Panel

@onready var viewport_container = get_node("SubViewportContainer")
@onready var viewport : SubViewport = get_node("SubViewportContainer/SubViewport")

var editor_selection = EditorInterface.get_selection()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	viewport_container.visible = false
	editor_selection.selection_changed.connect(update_preview_menu_visibility)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func update_preview_menu_visibility() :
	for node in editor_selection.get_selected_nodes() :
		if node is ThirdPersonCamera :
			viewport_container.visible = true
			var camera = node.get_camera()
			RenderingServer.viewport_attach_camera(viewport.get_viewport_rid(), camera.get_camera_rid())