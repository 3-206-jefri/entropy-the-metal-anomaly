extends Control

func _ready():
	$StartButton.pressed.connect(_on_start_pressed)

func _on_start_pressed():
	scene_manager.goto_world("res://scenes/levels/Level1.tscn")
	queue_free()
