extends Node2D
@export var bonus_speed = 2
var used = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play("idle")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body.is_in_group("Player") and !used:
		body.speed_up(bonus_speed)
		used = true
		$AnimatedSprite2D.play("used")
		$AudioStreamPlayer.play()
