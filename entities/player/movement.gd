extends Node
class_name Movement

@export var speed := 200.0

func process_movement(body: CharacterBody2D, dir: Vector2, delta: float):
	var v := Vector2.ZERO

	v = dir.normalized() * speed

	# v.y += 900 * delta

	body.velocity = v
	body.move_and_slide()
