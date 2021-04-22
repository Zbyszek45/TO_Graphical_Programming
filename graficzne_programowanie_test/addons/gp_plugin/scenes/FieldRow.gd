tool
extends HBoxContainer


func _ready():
	pass

func _on_DeleteButton_pressed():
	queue_free()

func get_modifier():
	return $Modifier.text
	
func get_type():
	return $Type.text

func get_name():
	return $Name.text

func set_row(modifier, type, name):
	$Modifier.clear()
	for m in Singleton.modifiers:
		$Modifier.add_item(m)
	
	$Type.clear()
	for t in Singleton.types:
		$Type.add_item(t)
	$Modifier.selected = (Singleton.get_modifier_by_name(modifier))
	$Type.selected = (Singleton.get_type_by_name(type))
	$Name.text = name
