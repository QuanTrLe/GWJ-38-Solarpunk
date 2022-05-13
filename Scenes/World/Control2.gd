extends Control


func _ready():
	get_tree().paused = true
	get_tree().get_nodes_in_group("Globe")[0].visible = false


func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			get_tree().paused = false
			get_tree().get_nodes_in_group("Globe")[0].visible = true
			queue_free()
