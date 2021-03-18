tool
extends EditorPlugin

const MainPanel = preload("res://addons/gp_plugin/MainPanel.tscn")
var main_panel_object

func _enter_tree():
	main_panel_object = MainPanel.instance()
	get_editor_interface().get_editor_viewport().add_child(main_panel_object)
	make_visible(false)

func _exit_tree():
	if main_panel_object:
		main_panel_object.queue_free()

func has_main_screen():
	return true

func make_visible(visible):
	if main_panel_object:
		main_panel_object.visible = visible

func get_plugin_name():
	return "Graphical Programming Plugin"

func get_plugin_icon():
	return get_editor_interface().get_base_control().get_icon("Node", "EditorIcons")
