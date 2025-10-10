class_name State extends Node

static var player: Player

func _ready() -> void:
	pass
	
## What happens when the player enters this State
func enter() -> void:
	pass

## What happens when the player exits this State
func exit() -> void:
	pass
	
func process(delta: float) -> State:
	return null
	
func physics(delta: float) -> State:
	return null
	
func handle_input(_event: InputEvent) -> State:
	return null
