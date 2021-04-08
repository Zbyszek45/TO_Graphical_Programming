tool
extends GraphEdit


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var classNode = preload("res://addons/gp_plugin/scenes/ClassNode.tscn")
signal node_changed

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func can_drop_data(position, data):
	return true

func drop_data(position, data):
	print("Dropped: ", data, position)
	var new_node = classNode.instance()
	self.add_child(new_node)
	new_node.title = data
	new_node.offset = position
	emit_signal("node_changed", new_node)

func class_node_changed(node):
	emit_signal("node_changed", node)



func _on_Graph_connection_request(from, from_slot, to, to_slot):
	if from != to:
		connect_node(from, from_slot, to, to_slot)


func _on_Graph_disconnection_request(from, from_slot, to, to_slot):
	disconnect_node(from, from_slot, to, to_slot)
