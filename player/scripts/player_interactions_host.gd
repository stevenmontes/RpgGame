class_name PlayerInteractionsHost extends Node2D

func update_direction(new_direction: Vector2) -> void:
	match new_direction:
		Vector2.DOWN:
			rotation_degrees = 0
		Vector2.UP:
			rotation_degrees = 180
		Vector2.LEFT:
			rotation_degrees = 90
		Vector2.RIGHT:
			rotation_degrees = -90
		_: 
			rotation_degrees = 0


func _on_player_direction_changed(new_direction: Vector2) -> void:
	update_direction(new_direction)
