extends CharacterBody2D

@onready var movement: CyborgMovement = $Movement
@onready var input: CyborgInput = $Input
@onready var anim: CyborgAnimation = $Anim

func _physics_process(delta: float) -> void:
	var dir := input.get_direction()

	movement.process_movement(self, dir, input, anim, delta)

	anim.update_animation(dir, velocity, self, input.is_jump_pressed(), delta)
