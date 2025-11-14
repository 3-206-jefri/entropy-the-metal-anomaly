extends Node
class_name SceneManager

var world_root: Node
var ui_root: Node
var current_world: Node = null

func _ready():
	var main = get_tree().root.get_node("Main")
	world_root = main.get_node("WorldRoot")
	ui_root    = main.get_node("UiRoot")

func goto_world(scene_path: String):
	if current_world:
		current_world.queue_free()
		
	var next = load(scene_path).instantiate()
	world_root.add_child(next)
	current_world = next
