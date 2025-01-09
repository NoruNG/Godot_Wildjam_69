extends Node2D

@export var LVL = ""



func _on_area_2d_body_entered(body):
	if body.is_in_group("Player"):
		$AudioStreamPlayer.play()
		get_tree().change_scene_to_file.call_deferred("res://LVLs/" + LVL + ".tscn")
		
