tool
extends Node

var modifiers = ["none", "const", "enum", "onready", "export"]
var types = ["var", "bool", "int", "float", "String", "Vector2", "Vector3", "Node"]


func _ready():
	print("I AM LOADED _ SINGLETON")

func get_modifier_by_name(name : String) -> int:
	print(modifiers.find(name))
	return modifiers.find(name)
	

func get_type_by_name(name : String) -> int:
	print(types.find(name))
	return types.find(name)
