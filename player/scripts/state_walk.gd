class_name State_Walk extends State

@export var move_speed: float = 100.0
@onready var idle: State_Idle = $"../Idle"

func _ready() -> void:
	pass
	
## What happens when the player enters this State
func enter() -> void:
	player.update_animation("walk")

## What happens when the player exits this State
func exit() -> void:
	pass
	
func process(delta: float) -> State:
	if player.direction == Vector2.ZERO:
		return idle
		
	player.velocity = player.direction * move_speed
	
	if player.set_direction():
		player.update_animation("walk")
		
	return null
	
func physics(delta: float) -> State:
	return null
	
func handle_input(_event: InputEvent) -> State:
	return null
