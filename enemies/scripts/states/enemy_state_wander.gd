class_name EnemyStateWander extends EnemyState

@export var anim_name: String = "walk"
@export var wander_speed: float = 20.0

@export_category("AI")
@export var state_animation_duration: float = 0.5
@export var states_cycles_min: int = 1
@export var states_cycles_max: int = 3
@export var next_state: EnemyState

var _timer: float = 0.0
var _direction: Vector2

func init() -> void:
	pass

## What happens when the player enters this State
func enter() -> void:
	_timer = randi_range(states_cycles_min, states_cycles_max) * state_animation_duration
	var rand = randi_range(0, 3)
	_direction = enemy.DIR_4[rand]
	enemy.velocity = _direction * wander_speed
	enemy.set_direction(_direction)
	enemy.update_animation(anim_name)
	pass

## What happens when the player exits this State
func exit() -> void:
	pass
	
func process(delta: float) -> EnemyState:
	_timer -= delta
	
	if _timer < 0:
		return next_state
		
	return null
	
func physics(_delta: float) -> EnemyState:
	return null
