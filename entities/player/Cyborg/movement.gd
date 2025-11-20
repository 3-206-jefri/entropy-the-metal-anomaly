extends Node
class_name CyborgMovement

var can_double_jump = false

func process_movement(
	body: CharacterBody2D,
	dir: Vector2,
	input: CyborgInput,
	anim: CyborgAnimation,
	delta: float
) -> void:
	var stats: CyborgStats = body.get_node("Stats")
	var was_on_floor_before := body.is_on_floor()
	var on_ground := body.is_on_floor()
	
	# Gravity
	if not on_ground:
		body.velocity.y += stats.gravity * delta

	# LOGIKA LONCAT / DOUBLE JUMP
	if input.is_jump_pressed():
		if on_ground:
			# Normal jump dari lantai
			body.velocity.y = stats.jump_force
			can_double_jump = true
		elif can_double_jump:
			# Double jump di udara
			body.velocity.y = stats.double_jump_force
			can_double_jump = false

	# GERAK HORIZONTAL
	if dir.x != 0:
		body.velocity.x = move_toward(body.velocity.x, dir.x * stats.move_speed, stats.move_speed)
	else:
		body.velocity.x = move_toward(body.velocity.x, 0, stats.move_speed)

	# APPLY FISIKA
	body.move_and_slide()

	# Reset double jump hanya ketika benar-benar mendarat
	if body.is_on_floor() and not was_on_floor_before:
		can_double_jump = false
		
	# Pass can_double_jump to anim for animation logic
	anim.set_can_double_jump(can_double_jump)

