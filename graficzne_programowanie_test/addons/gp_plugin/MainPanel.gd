tool
extends Control


var current_changed_node = null

func _ready():
	pass # Replace with function body.



func _on_Graph_node_changed(node):
	$ClassSettings.set_graph_node(node)
	$ClassSettings.show();
	$ClassSettings.popup_centered()

