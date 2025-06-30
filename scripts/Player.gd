extends CharacterBody2D
class_name Player

var SPEED = 5.00
const JUMP_VELOCITY = -400.0
signal move_amo_lowers

@export var max_move_amo = 500
var move_amo = 0
# Get the gravity from the project settings to be synced with RigidBody nodes.
var direction = velocity
var accalerating = false
var accalerating_y = false
var accalerating_x = false
var playing_fvx = false
func _ready():
	move_amo = max_move_amo

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		#velocity.y += gravity * delta
		pass
	#print(accalerating)
	print(move_amo)
	#print(velocity)
	if accalerating_y or accalerating_x:
		accalerating = true
		move_amo -= 1
		move_amo_lowers.emit()
		if !playing_fvx:
			$AudioStreamPlayer.play()
			playing_fvx = true
	else:
		$AudioStreamPlayer.stop()
		accalerating = false
		playing_fvx = false
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	#left and right
	var direction_x = Input.get_axis("ui_left", "ui_right")
	if direction_x and move_amo > 0:
		velocity.x += direction_x * -SPEED
		accalerating_x = true
		if direction_x < 0:
			$Flames/L.play("fiering")
		elif direction_x > 0:
			$Flames/R.play("fiering")
	else:
		$Flames/L.play("idle")
		$Flames/R.play("idle")
		velocity.x = move_toward(velocity.x, 0, 0)
		accalerating_x = false
		
		#up and down
		
	var direction_y = Input.get_axis("ui_up", "ui_down")
	if direction_y and move_amo > 0:
		velocity.y += direction_y * -SPEED
		accalerating_y = true
		if direction_y < 0:
			$Flames/U.play("fiering")
		elif direction_y > 0:
			$Flames/D.play("fiering")
	else:
		$Flames/U.play("idle")
		$Flames/D.play("idle")
		velocity.y = move_toward(velocity.y, 0, 0)
		accalerating_y = false
	move_and_slide()
	#print(SPEED)



func _on_area_2d_body_entered(body):
	if body.is_in_group("red_blocks"):
		die()
		
func _process(delta):
	var fps = Engine.get_frames_per_second()
	#print(fps)

func die():
	get_tree().reload_current_scene()
	
func speed_up():
	SPEED *= 1
	
func reset_move_amo():
	move_amo = max_move_amo
