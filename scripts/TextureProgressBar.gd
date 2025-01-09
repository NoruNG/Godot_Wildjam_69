extends TextureProgressBar

@export var player = Player

#@export var green_portal: Green_Portal
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func update():
	value = player.move_amo * 100 / player.max_move_amo

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update()
