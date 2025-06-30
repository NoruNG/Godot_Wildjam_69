extends Node2D
var used : bool = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	pass

func _on_lever_body_entered(body):
	if body.is_in_group("Player") and !used:
		$Lever/AnimatedSprite2D.play("used")
		$AudioStreamPlayer.play()
		await get_tree().create_timer(0.5).timeout
		queue_free()
		
