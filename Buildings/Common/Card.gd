class_name Card
extends CollisionShape2D


static func check_and_send(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and !event.pressed:
			return true
