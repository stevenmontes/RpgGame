class_name EnemyStateChase extends EnemyState

@export var anim_name: String = "chase"
@export var chase_speed: float = 40.0
@export var turn_rate: float = 0.25

@export_category("AI")
@export var vision_area: VisionArea
@export var attack_area: HurtBox
@export var state_aggro_duration: float = 0.5
@export var next_state: EnemyState

var _timer: float = 0.0
var _direction: Vector2
var _can_see_player: bool = false

func init() -> void:
	if vision_area:
		vision_area.player_entered.connect(_on_player_entered)
		vision_area.player_exited.connect(_on_player_exited)

## What happens when the player enters this State
func enter() -> void:
	_timer = state_aggro_duration
	enemy.update_animation(anim_name)
	
	if attack_area:
		attack_area.monitoring = true
	pass

## What happens when the player exits this State
func exit() -> void:
	if attack_area:
		attack_area.monitoring = false
		_can_see_player = false
	
func process(delta: float) -> EnemyState:
	var new_direction: Vector2 = enemy.global_position.direction_to(PlayerManager.player.global_position)
	_direction = lerp(_direction, new_direction, turn_rate)
	enemy.velocity = _direction * chase_speed
	
	if enemy.set_direction(_direction):
		enemy.update_animation(anim_name)
	
	if not _can_see_player:
		_timer -= delta
	
		if _timer < 0:
			return next_state
	else:
		_timer = state_aggro_duration
		
	return null
	
func physics(_delta: float) -> EnemyState:
	return null
	
func _on_player_entered() -> void:
	_can_see_player = true
	
	if state_machine.current_state is EnemyStateStun:
		return
	
	state_machine.change_state(self)

func _on_player_exited() -> void:
	_can_see_player = false
