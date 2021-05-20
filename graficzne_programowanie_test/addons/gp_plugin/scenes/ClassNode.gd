tool
extends GraphNode

var fields
var methods

var fieldScene = preload("res://addons/gp_plugin/scenes/node_parts/FieldsNode.tscn")
var fieldRow = preload("res://addons/gp_plugin/scenes/FieldRow.tscn")

var methodsRow = preload("res://addons/gp_plugin/scenes/MethodRow.tscn")
var methodsScene = preload("res://addons/gp_plugin/scenes/node_parts/MethodsNode.tscn")

func _ready():
	self.set_slot(0, true, 0, Color.blue, true, 0, Color.blue,
	load("res://addons/gp_plugin/scenes/node_parts/blue_dot.png"),
	load("res://addons/gp_plugin/scenes/node_parts/blue_inh.png"))
	self.set_slot(1, true, 1, Color.red, true, 1, Color.red,
	load("res://addons/gp_plugin/scenes/node_parts/red_aggr.png"),
	load("res://addons/gp_plugin/scenes/node_parts/red_dot.png"))
	
	fields = $Fields/List
	methods = $Methods/List

func get_path():
	return $Path/HBoxContainer/LineEdit.text

func get_fields_list():
	var list = []
	for child in fields.get_children():
		var d = {}
		d["name"] = child.get_name()
		d["type"] = child.get_type()
		d["modifier"] = child.get_modifier()
		list.append(d)
	
	return list

func get_methods_list():
	var list = []
	for child in methods.get_children():
		var d = {}
		d["name"] = child.get_name()
		list.append(d)
	
	return list

func _on_ClassNode_close_request():
	self.queue_free()


func _on_ClassNode_gui_input(event):
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == BUTTON_RIGHT:
		print("I was clicked: ", self)
		get_parent().class_node_changed(self)

func update_fields(new_fields):
	for child in fields.get_children():
		child.queue_free()
	
	for field in new_fields:
		fields.add_child(field)

func update_methods(new_methods):
	for child in methods.get_children():
		child.queue_free()
	
	for method in new_methods:
		methods.add_child(method)

func get_fields():
	var list = []
	for child in fields.get_children():
		var new = fieldRow.instance()
		new.set_row(child.get_modifier(), child.get_type(), child.get_name())
		list.append(new)
	
	return list

func get_methods():
	var list = []
	for child in methods.get_children():
		var new = methodsRow.instance()
		new.set_row(child.get_name())
		list.append(new)
	
	return list

func _on_ClassNode_resize_request(new_minsize):
	self.rect_size = new_minsize


func _on_LineEdit_gui_input(event):
	if event is InputEventMouseButton and event.is_pressed():
		$Path/FolderPath.show()
		

func _on_FolderPath_dir_selected(dir):
	$Path/HBoxContainer/LineEdit.text = $Path/FolderPath.current_dir
