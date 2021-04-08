tool
extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var current_changed_node = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Graph_node_changed(node):
	$ClassSettings.set_graph_node(node)
	$ClassSettings.show();
	$ClassSettings.popup_centered()

