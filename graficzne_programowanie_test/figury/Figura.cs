using Godot;
using System;

public class Figura : Node{

public String get_pole(){ return "Zwrócono pole"; }

public void get_obwod(){ return; }

}

extends Node2D

func _ready():
	do_something()

func do_something():
	var kwadrat_class = load("res://figury/Kwadrat.cs")
	var kwadrat = kwadrat_class.new()
	$Label.text = kwadrat.get_pole()
	return
