class_name State_Idle extends State

@onready var walk: State = $"../Walk"
@onready var attack: State = $"../Attack"

func _ready() -> void:
	pass
	
## What happens when the player enters this State
func enter() -> void:
	player.update_animation("idle")

## What happens when the player exits this State
func exit() -> void:
	pass
	
func process(_delta: float) -> State:
	if player.direction != Vector2.ZERO:
		return walk
	
	player.velocity = Vector2.ZERO
	return null
	
func physics(_delta: float) -> State:
	return null
	
func handle_input(_event: InputEvent) -> State:
	if _event.is_action_pressed('attack'):
		return attack
		
	return null
