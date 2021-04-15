tool
extends HBoxContainer


func _ready():
	pass

func get_name():
	return $Name.text

func set_row(name):
	$Name.text = name


func _on_Button_pressed():
	queue_free()
