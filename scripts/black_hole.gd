extends Node2D

var player = Player
var g = 0 
@export var growth = 1.00
var active = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	rotation_degrees += 5
	if !active and Input.is_action_just_pressed("ui_left") or Input.is_action_just_pressed("ui_right") or Input.is_action_just_pressed("ui_up") or Input.is_action_just_pressed("ui_down"):
		active = true
	if active:
		scale.x +=  g
		scale.y +=  g
		g += 0.0001 * growth
func _on_area_2d_body_entered(body):
	if body.is_in_group("Player"):
		body.die()
		
