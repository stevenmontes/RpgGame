class_name HurtBox extends Area2D

@export var damage: int = 1

func _ready() -> void:
	area_entered.connect(body_entered)

func body_entered(area: Area2D) -> void:
	if area is HitBox:
		area.take_damage(self)
