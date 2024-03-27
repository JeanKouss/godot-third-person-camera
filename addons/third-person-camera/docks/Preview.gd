@tool
extends MenuButton

var TPC_AUTOLOAD_NAME = "TpcAutoload"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_popup().index_pressed.connect(_on_popup_item_pressed)
	print('hehe')
	pass


func _on_popup_item_pressed(index) :
	var is_checked = get_popup().is_item_checked(index)
	var id  = get_popup().get_item_id(index)
	is_checked = !is_checked
	get_popup().set_item_checked(index, is_checked)
	get_node("/root/"+TPC_AUTOLOAD_NAME).on_preview_toggle(id, is_checked)
