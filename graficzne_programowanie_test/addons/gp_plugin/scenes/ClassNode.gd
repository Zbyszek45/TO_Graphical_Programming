tool
extends GraphNode


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	self.set_slot(0, true, 0, Color.blue, true, 0, Color.blue)
	self.set_slot(2, true, 1, Color.red, true, 1, Color.red)



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ClassNode_close_request():
	self.queue_free()


func _on_ClassNode_gui_input(event):
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == BUTTON_RIGHT:
		print("I was clicked: ", self)
		get_parent().class_node_changed(self)
