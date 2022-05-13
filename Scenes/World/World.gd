extends Node2D

export var Solar_1: PackedScene
export var Solar_2: PackedScene
export var Industry_1: PackedScene
export var Industry_2:PackedScene
export var Cancel: PackedScene

var direction


func _ready():
	Global.get_node("Time_limit").start(Global.time_limit)


func _process(delta):
	$Control/Green.text = "Green: " + str(Global.green)
	$Control/Money.text = "Money: " + str(Global.money)
	if Global.seconds < 10:
		$Control/Time_left.text = "Time left: " + str(Global.minutes) +":0" + str(Global.seconds)
	else:
		$Control/Time_left.text = "Time left: " + str(Global.minutes) +":" + str(Global.seconds)
	
	match Global.background:
		Global.Background.RED:
			$Control/ColorRect.color = Color.darkred
		Global.Background.ORANGE:
			$Control/ColorRect.color = Color.darkorange
		Global.Background.BLUE:
			$Control/ColorRect.color = Color.lightblue
		Global.Background.GREEN:
			$Control/ColorRect.color = Color.lightgreen
	

func spawn_building(building):
	match building:
		"solar_1":
			$Globe/Buildings.add_child(Solar_1.instance())
			print("Solar_1")
		"solar_2":
			$Globe/Buildings.add_child(Solar_2.instance())
			print("Solar_2")
		"industry_1":
			$Globe/Buildings.add_child(Industry_1.instance())
			print("Industry_1")
		"industry_2":
			$Globe/Buildings.add_child(Industry_2.instance())
			print("Industry_2")
		"cancel":
			add_child(Cancel.instance())
