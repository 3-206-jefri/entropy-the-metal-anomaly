extends Node
class_name Movement

@export var speed: float = 200.0
@export var gravity: float = 900.0
@export var jump_force: float = -450.0

func process_movement(body: CharacterBody2D, dir: Vector2, jump: bool, delta: float) -> void:

	body.velocity.x = dir.x * speed

	body.velocity.y += gravity * delta

	if jump and body.is_on_floor():
		body.velocity.y = jump_force

	body.move_and_slide()
