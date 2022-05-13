extends Node2D


export var money = 15
export var green = 500

var score = 0

var time_limit = 120
var time_left : int
var minutes : int
var seconds : int

export var finished: PackedScene

enum Background {RED,ORANGE,BLUE,GREEN}
var background = Background.BLUE


func _on_Time_limit_timeout():
	score = money + green * 2
	get_tree().change_scene_to(finished)


func _process(_delta):
	if green < 250: background = Background.RED
	elif green < 500: background = Background.ORANGE
	elif green < 900: background = Background.BLUE
	else: background = Background.GREEN
	
	
	time_left = int($Time_limit.time_left)
	
	if time_left % 60 == 0:
		minutes = time_left / 60
		seconds = 0
	
	elif time_left % 60 != 0:
		seconds = time_left % 60
		time_left -= seconds
		minutes = time_left / 60
