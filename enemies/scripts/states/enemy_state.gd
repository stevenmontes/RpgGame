class_name EnemyState extends Node

## Stores reference to the enemy that this state belongs to
var enemy: Enemy
var state_machine: EnemyStateMachine

func init() -> void:
	pass

## What happens when the player enters this State
func enter() -> void:
	pass

## What happens when the player exits this State
func exit() -> void:
	pass
	
func process(_delta: float) -> EnemyState:
	return null
	
func physics(_delta: float) -> EnemyState:
	return null
