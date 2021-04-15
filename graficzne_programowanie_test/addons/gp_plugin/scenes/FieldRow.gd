tool
extends HBoxContainer


func _ready():
	$Modifier.clear()
	for m in Singleton.modifiers:
		$Modifier.add_item(m)
	
	$Type.clear()
	for t in Singleton.types:
		$Type.add_item(t)

func _on_DeleteButton_pressed():
	queue_free()

func get_modifier():
	return $Modifier.text
	
func get_type():
	return $Type.text

func get_name():
	return $Name.text

func set_row(modifier, type, name):
	$Modifier.text = modifier
	$Type.text = type
	$Name.text = name
