extends Node
class_name DroidZapperMovement

var ai

func _init(ai_ref):
	ai = ai_ref

func move_toward_target(delta):
	if ai.detection.target == null:
		return

	var target: Node2D = ai.detection.target
	var dx: float = target.global_position.x - ai.pivot.global_position.x
	var dir: float = sign(dx)

	apply_flip(dir)

	ai.body.velocity.x = dir * ai.stats.speed
	ai.body.move_and_slide()


func apply_flip(dir: float):
	if dir == 0.0:
		return

	ai.pivot.scale.x = -1.0 if dir < 0.0 else 1.0

	ai.agro_area.position.x = abs(ai.agro_area.position.x) * ai.pivot.scale.x
	ai.attack_area.position.x = abs(ai.attack_area.position.x) * ai.pivot.scale.x
