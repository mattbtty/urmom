extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var gravity = ProjectSettings.get("physics/2d/default_gravity")
onready var velocity = Vector2()
onready var jumps = 1
signal finished
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _physics_process(delta):
	
	velocity.y += gravity * delta * 7
	
	if (Input.is_action_pressed("ui_right")):
		velocity.x = 200
	elif (Input.is_action_pressed("ui_left")):
		velocity.x = -200
	else:
		velocity.x = 0
		
	if (Input.is_action_just_pressed("ui_up") && jumps > 0):
		velocity.y = -400
		print(jumps)
		jumps -= 1
	
	if (self.is_on_floor() && !Input.is_action_just_pressed("ui_up")):
		jumps = 1
		print(self.is_on_floor())
	
	var _slide = move_and_slide(velocity, Vector2.UP)
	
	for i in get_slide_count():
		var collision = get_slide_collision(i)
	


func _on_Finish_Line_body_entered(body):
	emit_signal("finished")
	print("we won")
