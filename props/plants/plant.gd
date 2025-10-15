class_name Plant extends Node2D

func take_damage(_hurt_box: HurtBox) -> void:
	queue_free()

func _on_hit_box_damaged(hurt_box: HurtBox) -> void:
	take_damage(hurt_box)
