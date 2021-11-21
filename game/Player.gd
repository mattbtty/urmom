extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var gravity = ProjectSettings.get("physics/2d/default_gravity")
onready var velocity = Vector2()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _physics_process(delta):
	
	velocity.y += gravity * delta
	
	if (Input.is_action_pressed("ui_right")):
		velocity.x = 200
	elif (Input.is_action_pressed("ui_left")):
		velocity.x = -200
	else:
		velocity.x = 0
		
	if (Input.is_action_just_pressed("ui_up")):
		velocity.y = -300
	
	var _slide = move_and_slide(velocity, Vector2.UP)
	
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if (collision != null):
			print("Collided with: ", collision.collider.name)
	


func _on_Finish_Line_body_entered(body):
	print("we won")
