extends KinematicBody2D

export var radius = 150


func _ready():
	global_position = Vector2(512,300)
	$CollisionShape2D.shape.radius = radius


func _physics_process(delta):
	rotation_degrees += 5*delta
