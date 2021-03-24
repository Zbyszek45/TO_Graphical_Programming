tool
extends ItemList


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func get_drag_data(position):
	var tmp = TextureRect.new();
	tmp.texture = load("res://icon.png")
	set_drag_preview(tmp)
	var s = get_selected_items()
	return self.get_item_text(s[0])
