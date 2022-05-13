extends Node2D

var globe
var outside_globe = true
var not_colliding = 0

enum State {PLACING, PLACED}
var state
var price


func _ready():
	globe = get_tree().get_nodes_in_group("Globe")[0]
	state = State.PLACING


func _process(delta):
	match state:
		State.PLACING:
			placing()
		State.PLACED:
			placed()


func placing():
	if !outside_globe or not_colliding > 0:
		modulate = Color.red
	else:
		modulate = Color.white
	
	var direction = get_global_mouse_position() - globe.global_position
	if abs(direction.length()) < globe.radius: outside_globe = false
	else: outside_globe = true
	direction = direction.normalized() * globe.radius
	global_position = globe.global_position + direction
	
	look_at(get_global_mouse_position())
	rotation_degrees += 90
	
	if Input.is_action_just_pressed("place") and outside_globe and not_colliding == 0:
		state = State.PLACED
		Global.money -= price
	elif Input.is_action_just_pressed("cancel"):
		queue_free()


func placed():
	pass


func produce(money,green):
	Global.money += money
	Global.green += green


func check_entered(area):
	if area.get_parent().is_in_group("Building") and state == State.PLACING:
		not_colliding += 1


func check_exited(area):
	if area.get_parent().is_in_group("Building") and state == State.PLACING:
		not_colliding -= 1
