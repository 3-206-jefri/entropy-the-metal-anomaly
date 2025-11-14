extends Node

func _ready():
	var menu = load("res://scenes/ui/MainMenu.tscn").instantiate()
	$UiRoot.add_child(menu)
