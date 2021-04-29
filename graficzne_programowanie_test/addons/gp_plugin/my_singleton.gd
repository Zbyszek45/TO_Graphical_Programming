tool
extends Node

var modifiers = ["none", "onready", "export"]
var types = ["var", "bool", "int", "float", "String", "Vector2", "Vector3", "Node"]


func _ready():
	print("I AM LOADED _ SINGLETON")

func get_modifier_by_name(name : String) -> int:
	print(modifiers.find(name))
	return modifiers.find(name)
	

func get_type_by_name(name : String) -> int:
	print(types.find(name))
	return types.find(name)

func generateCS(list):
	for node in list:
		var file := File.new();
		var pfile: String
		if node["path"].length() < 1:
			pfile = ""
		else:
			pfile = node["path"] + "/"
		file.open(pfile + node["name"] + ".cs", File.WRITE)
		
		file.store_string("using Godot;\nusing System;\n\n")
		file.store_string("public class "+ node["name"] + " : " + node["parent"] + "{\n")
		for field in node["fields"]:
			if (field["modifier"] != "none") and (field["modifier"] != "onready"):
				file.store_string("[Export]\n")
			if field["type"] != "var":
				file.store_string("private "+ field["type"] + " " + field["name"] + ";\n")
			else:
				file.store_string("Node " + field["name"] + ";\n")
		file.store_string("\n")
		for method in node["methods"]:
			file.store_string("public void " + method["name"] + "(){ return; }\n\n")
		file.store_string("}")

func generateGD(list):
	for node in list:
		var file := File.new();
		var pfile: String
		if node["path"].length() < 1:
			pfile = ""
		else:
			pfile = node["path"] + "/"
		file.open(pfile + node["name"] + ".gd", File.WRITE)
		file.store_string("extends " + node["parent"] + "\n\n")
		file.store_string("class_name " + node["name"] + "\n\n")
		for field in node["fields"]:
			if (field["modifier"] != "none"):
				file.store_string(field["modifier"] + " ")
			if field["type"] != "var":
				file.store_string("var " + field["name"] + ": " + field["type"] + "\n")
			else:
				file.store_string("var " + field["name"] + "\n")
		file.store_string("\n")
		for method in node["methods"]:
			file.store_string("func " + method["name"] + "(): return\n\n")
		print(node["name"])
		print(node["parent"])
		print(node["path"])
		print(node["fields"])
		print(node["methods"])
	


#	var file := File.new()
#	file.open("cat.gd", File.WRITE)
#	file.store_string("Hello this wil be cat class")
#	file.close()
