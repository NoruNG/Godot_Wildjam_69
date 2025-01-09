extends Node2D

@export var despawn = 5
var triggerd = false
var g = 0 
@export var growth = 1.00
var collapsing = false
var active = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if !active and Input.is_action_just_pressed("ui_left") or Input.is_action_just_pressed("ui_right") or Input.is_action_just_pressed("ui_up")or Input.is_action_just_pressed("ui_down"):
		active = true
	rotation_degrees += 5
	scale.x +=  g
	scale.y +=  g
	if triggerd and !collapsing and active:
		g += 0.0001 * growth
		collapse_timer()
	if collapsing:
		collapse()
	
func _on_area_2d_body_entered(body):
	if body.is_in_group("Player"):
		body.die()
		

func collapse_timer():
	if !collapsing:
		await get_tree().create_timer(despawn).timeout
		collapsing = true

func collapse():
	g -= 0.0050 * growth
	if scale.x < 0.1:
		queue_free()
	

func _on_trigger_area_body_entered(body):
	if body.is_in_group("Player") and !triggerd:
		triggerd = true
