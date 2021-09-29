extends Position2D

const SCENE = preload("res://Ball/PachinkoBall.tscn")
onready var pachinkoball = $PachinkoBall
onready var launch = $PachinkoBall.launch


#Timer
var timer = null
export var shoot_delay = .10
var can_shoot = true

func _ready():
	
	#Shot Timer
	timer = Timer.new()
	timer.set_wait_time(shoot_delay)
	timer.connect("timeout", self, "on_timeout_complete")
	add_child(timer)
func on_timeout_complete():
		can_shoot = true


#Spawn Ball
func _physics_process(delta):
	if Input.get_action_strength("power_up"):
		pachinkoball.launch += 25
		print(pachinkoball.launch)
	
	var ball = SCENE.instance()
	if Input.is_action_pressed("spawn_ball") && can_shoot:
		add_child(ball)
		
		can_shoot = false
		
		
		timer.start()
		
 
func _on_BallLauncher_body_entered(body: Node) -> void:
	$PachinkoBall.apply_impulse(Vector2(0,0), Vector2(0, launch))
