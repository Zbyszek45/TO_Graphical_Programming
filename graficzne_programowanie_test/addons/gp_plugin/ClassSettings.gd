tool
extends WindowDialog

var graphNode = null
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_graph_node(node):
	graphNode = node

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ClassSettings_about_to_show():
	if graphNode != null:
		$MarginC/TabContainer/Basic/ClassName/LineEdit.text = graphNode.get_title()
		


func _on_ClassSettings_popup_hide():
	graphNode = null


func _on_LineEdit_text_changed(new_text):
	if graphNode != null:
		graphNode.set_title($MarginC/TabContainer/Basic/ClassName/LineEdit.text)
