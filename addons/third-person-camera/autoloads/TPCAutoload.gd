@tool
extends Node

signal preview_enabled
signal preview_desabled

func on_preview_toggle(id, preview_on) :
	if preview_on :
		preview_enabled.emit(id)
	else :
		preview_desabled.emit(id)
	
