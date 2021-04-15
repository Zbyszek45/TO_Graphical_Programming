tool
extends HBoxContainer

var real_name

func _ready():
	pass

func set_row(name):
	real_name = name
	$Name.text = name + "(...)"

func get_name():
	return real_name
