tool
extends WindowDialog

var graphNode = null
var add_field_button
var field_list
var method_list

var fieldScene = preload("res://addons/gp_plugin/scenes/FieldRow.tscn")
var fieldNodeScene = preload("res://addons/gp_plugin/scenes/node_parts/FieldsNode.tscn")

var methodsScene = preload("res://addons/gp_plugin/scenes/MethodRow.tscn")
var methodsNodeScene = preload("res://addons/gp_plugin/scenes/node_parts/MethodsNode.tscn")

func _ready():
	add_field_button = $MarginC/TabContainer/Fields/Scr/VB/AddButton
	field_list = $MarginC/TabContainer/Fields/Scr/VB/FieldsList
	method_list = $MarginC/TabContainer/Methods/Scr/VB/MethodList

func set_graph_node(node):
	graphNode = node
	
	for child in field_list.get_children():
		child.queue_free()
	
	for child in method_list.get_children():
		child.queue_free()
	
	for field in graphNode.get_fields():
		field_list.add_child(field)
	
	for method in graphNode.get_methods():
		method_list.add_child(method)

func _on_ClassSettings_about_to_show():
	if graphNode != null:
		$MarginC/TabContainer/Basic/ClassName/LineEdit.text = graphNode.get_title()
		

func _on_ClassSettings_popup_hide():
	
	graphNode.update_fields(transform())
	graphNode.update_methods(get_method_list())
	graphNode = null


func _on_LineEdit_text_changed(new_text):
	if graphNode != null:
		graphNode.set_title($MarginC/TabContainer/Basic/ClassName/LineEdit.text)


func _on_add_field_button_pressed():
	var new_field = fieldScene.instance()
	field_list.add_child(new_field)

func transform():
	var list = []
	for child in field_list.get_children():
		var new = fieldNodeScene.instance()
		new.set_row(child.get_modifier(), child.get_type(), child.get_name())
		list.append(new)
	
	return list

func _on_method_AddButton_pressed():
	var new_method = methodsScene.instance()
	method_list.add_child(new_method)
	

func get_method_list():
	var list = []
	for child in method_list.get_children():
		var new = methodsNodeScene.instance()
		new.set_row(child.get_name())
		list.append(new)
	
	return list
