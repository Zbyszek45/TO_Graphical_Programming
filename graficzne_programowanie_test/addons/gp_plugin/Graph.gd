tool
extends GraphEdit


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func can_drop_data(position, data):
	return true

func drop_data(position, data):
	print("Dropped: ", data, position)
	var new_node = GraphNode.new();
	self.add_child(new_node)
	new_node.title = data
	new_node.offset = position
	new_node.rect_min_size = Vector2(0, 80)


