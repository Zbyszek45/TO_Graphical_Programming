tool
extends HBoxContainer


func _ready():
	pass # Replace with function body.

func set_row(modifier, type, name):
	$Modifier.text = modifier
	$Type.text = type
	$Name.text = name

func get_modifier():
	return $Modifier.text
	
func get_type():
	return $Type.text

func get_name():
	return $Name.text
