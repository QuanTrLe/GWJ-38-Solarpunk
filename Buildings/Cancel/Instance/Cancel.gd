extends Node2D

var selected_nodes = []


func _process(delta):
	global_position = get_global_mouse_position()
	
	if selected_nodes != []:
		if Input.is_action_just_pressed("place"):
			for i in selected_nodes:
				i.queue_free()
	if Input.is_action_just_pressed("cancel"):
		queue_free()


func _on_Area2D_area_entered(area):
	if area.get_parent().is_in_group("Building"):
		selected_nodes.append(area.get_parent())


func _on_Area2D_area_exited(area):
	if area.get_parent().is_in_group("Building"):
		selected_nodes.erase(area.get_parent())
