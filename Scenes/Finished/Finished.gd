extends Node2D

export var game: PackedScene


func _ready():
	$Control/Score.text = "Score: Money + 2xGreen! \r\n" + str(Global.score)
	$Control/Money.text = "Money: " + str(Global.money)
	$Control/Green.text = "Green: " + str(Global.green)


func _process(delta):
	match Global.background:
		Global.Background.RED:
			$Control/ColorRect.color = Color.darkred
		Global.Background.ORANGE:
			$Control/ColorRect.color = Color.darkorange
		Global.Background.BLUE:
			$Control/ColorRect.color = Color.lightblue
		Global.Background.GREEN:
			$Control/ColorRect.color = Color.lightgreen


func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT:
			get_tree().change_scene_to(game)
