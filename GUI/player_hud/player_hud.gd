extends CanvasLayer

var hearts: Array[HeartGUI] = []

func _ready() -> void:
	for child in $Control/HFlowContainer.get_children():
		if child is HeartGUI:
			hearts.append(child)
			child.visible = false

func update_hp(hp: int, max_hp: int) -> void:
	update_max_hp(max_hp)
	
	for ind in max_hp:
		update_heart(ind, hp)

func update_heart(index: int, hp: int) -> void:
	var new_value: int = clampi(hp - index * 2, 0, 2)
	hearts[index].value = new_value
	pass
	
func update_max_hp(max_hp: int) -> void:
	var heart_count: int = roundi(max_hp * 0.5)
	
	for i in hearts.size():
		if i < heart_count:
			hearts[i].visible = true
		else:
			hearts[i].visible = false
