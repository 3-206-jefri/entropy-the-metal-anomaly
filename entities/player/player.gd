extends CharacterBody2D

@onready var movement = $Movement
@onready var input = $Input
@onready var anim = $Anim

func _physics_process(delta):
	var dir: Vector2 = input.get_direction()

	movement.process_movement(self, dir, delta)

	anim.update_animation(dir, velocity)
