extends Node
class_name PlayerAnimation

@onready var sprite: AnimatedSprite2D = get_parent().get_node("AnimatedSprite2D")
var was_on_floor: bool = false

func update_animation(dir: Vector2, vel: Vector2, body: CharacterBody2D) -> void:

	if dir.x < 0.0:
		sprite.flip_h = true
	elif dir.x > 0.0:
		sprite.flip_h = false

	var frames := sprite.sprite_frames

	if not body.is_on_floor():
		was_on_floor = false

		if vel.y < 0.0:
			if frames.has_animation("Jumping"):
				if sprite.animation != "Jumping":
					sprite.play("Jumping")
			return

		elif vel.y > 0.0:
			if frames.has_animation("Falling"):
				if sprite.animation != "Falling":
					sprite.play("Falling")
			return

	else:
		if not was_on_floor:
			was_on_floor = true
			if frames.has_animation("Landing"):
				sprite.play("Landing")
				return

		if abs(dir.x) > 0.1:
			if frames.has_animation("Running"):
				if sprite.animation != "Running":
					sprite.play("Running")
			return

		if frames.has_animation("Idle"):
			if sprite.animation != "Idle":
				sprite.play("Idle")
		else:
			sprite.stop()

	was_on_floor = body.is_on_floor()
