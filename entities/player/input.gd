extends Node
class_name PlayerInput

func get_direction() -> Vector2:
	var x := Input.get_action_strength("player_right") - Input.get_action_strength("player_left")
	var y := Input.get_action_strength("player_down")  - Input.get_action_strength("player_up")
	return Vector2(x, y)
