class_name Plant extends Node2D

func take_damage(_damage: int) -> void:
	queue_free()

func _on_hit_box_damaged(damage: int) -> void:
	take_damage(damage)
