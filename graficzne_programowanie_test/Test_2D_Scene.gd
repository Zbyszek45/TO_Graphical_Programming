extends Node2D

func _ready():
	do_something()

func do_something():
	var my_cat = load("res://bla/Pies.cs")
	var c = my_cat.new()
	print(c.krzycz())
	return

func sm(): return
