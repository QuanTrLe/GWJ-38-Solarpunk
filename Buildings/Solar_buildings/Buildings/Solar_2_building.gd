extends "res://Buildings/Common/Building.gd"

export var money = 80
export var green = 45
export var production_time = 6


func _ready():
	price = 250
	if Global.money < price:
		queue_free()


func placed():
	if $Production_timer.time_left <= 0:
		$Production_timer.start(production_time)


func _on_Area2D_area_entered(area):
	check_entered(area)


func _on_Area2D_area_exited(area):
	check_exited(area)


func _on_Production_timer_timeout():
	produce(money, green)
