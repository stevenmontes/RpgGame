extends Node

const PLAYER = preload("res://player/player.tscn")

var player: Player
var player_spawn: bool = false

func _ready() -> void:
	add_player_instance()
	await get_tree().create_timer(0.5).timeout
	player_spawn = true

func add_player_instance() -> void:
	player = PLAYER.instantiate()
	add_child(player)

func set_player_position(new_pos: Vector2) -> void:
	player.global_position = new_pos
	
func set_as_parent(_parent: Node2D) -> void:
	if player.get_parent():
		player.get_parent().remove_child(player)
		
	_parent.add_child(player)
	
func unparent_player(_parent: Node2D) -> void:
	_parent.remove_child(player)
