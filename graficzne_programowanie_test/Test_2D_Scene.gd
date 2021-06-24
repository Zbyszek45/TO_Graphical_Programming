extends Node2D

func _ready():
	do_something()

func do_something():
	
	
#	var student_class = load("res://uczelnia/Student.cs")
#	var s = student_class.new()
	
	var s = Student.new()
	$Label.text = s.zyj()
	

	return
