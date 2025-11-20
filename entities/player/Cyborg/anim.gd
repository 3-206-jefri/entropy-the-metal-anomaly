extends Node
class_name CyborgAnimation

@onready var sprite: AnimatedSprite2D = get_parent().get_node("AnimatedSprite2D")

var can_double_jump = false

func set_can_double_jump(value: bool) -> void:
	can_double_jump = value

func update_animation(
	dir: Vector2,
	vel: Vector2,
	body: CharacterBody2D,
	jump_pressed: bool,
	delta: float
) -> void:
	var on_ground := body.is_on_floor()

	# Flip sprite based on direction
	if dir.x < 0:
		sprite.flip_h = true
	elif dir.x > 0:
		sprite.flip_h = false

	# ====== LOGIKA ANIMASI ======
	if on_ground:
		if dir.x != 0:
			sprite.play("Run")
		else:
			sprite.play("Idle")
	else:
		# Di udara
		if vel.y < 0:
			# Lagi naik
			if can_double_jump:
				# Loncat pertama
				sprite.play("Jump")
			else:
				# Setelah double jump
				sprite.play("DoubleJump")
		elif dir.x == 0:
			# Lagi turun
			sprite.play("Fall")

