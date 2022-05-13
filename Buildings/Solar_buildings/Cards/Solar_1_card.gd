extends Sprite
var base = preload("res://Buildings/Common/Card.gd")


func _ready():
	base.new()


func _on_Area2D_input_event(_viewport, event, _shape_idx):
	if base.check_and_send(event): get_tree().call_group("World","spawn_building","solar_1")
