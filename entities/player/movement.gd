extends Node
class_name Movement

@export var speed := 200.0
@export var gravity := 900.0

func process_movement(body: CharacterBody2D, dir: Vector2, delta: float):
	body.velocity.x = dir.x * speed

	body.velocity.y += gravity * delta

	body.move_and_slide()
