class_name State extends Node

static var player: Player
static var state_machine: PlayerStateMachine
func _ready() -> void:
	pass
	
func init() -> void:
	pass	

## What happens when the player enters this State
func enter() -> void:
	pass

## What happens when the player exits this State
func exit() -> void:
	pass
	
func process(_delta: float) -> State:
	return null
	
func physics(_delta: float) -> State:
	return null
	
func handle_input(_event: InputEvent) -> State:
	return null
