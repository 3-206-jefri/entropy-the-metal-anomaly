extends Node
class_name PlayerAnimation

@onready var sprite := get_parent().get_node("AnimatedSprite2D")

func update_animation(dir: Vector2, vel: Vector2):
	if dir.x < 0:
		sprite.flip_h = true
	elif dir.x > 0:
		sprite.flip_h = false

	if abs(dir.x) > 0:
		if sprite.animation != "Running":
			sprite.play("Running")
	else:
		sprite.stop()
