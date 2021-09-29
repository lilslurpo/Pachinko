extends RigidBody2D


export var bounce_str = 0.2
var launch = -100





func _process(delta: float) -> void:
	if Input.get_action_strength("power_up"):
		launch -= 25
		print(launch)
#	if Input.is_action_just_pressed("power_down"):
#		apply_impulse(Vector2(0, 0), Vector2(0, launch))


func _on_Area2D_body_entered(body: Node) -> void:
	queue_free()




func _on_BallLauncher_body_entered(body: Node) -> void:
	apply_impulse(Vector2.ZERO, Vector2(0 , launch))
