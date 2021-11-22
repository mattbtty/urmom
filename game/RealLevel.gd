extends Node2D
const Victory = preload("res://VictoryScreen.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Player_finished():
	var victory = Victory.instance()
	victory.set_as_toplevel(true)
	add_child(victory)
	pass # Replace with function body.
	
func leave():
	get_tree().change_scene("res://LevelSelect.tscn")
