extends Area2D
signal point_for_player_1
signal point_for_player_2

@export var speed = 400

@export var direction = Vector2(-2,randf() * 2 - 1)

# @export var direction = Vector2(randf_range(-2, 2), randf_range(-2, 2))
var screen_size = get_viewport_rect().size # Size of the game window.

# Called when the node enters the scene tree for the first time.
func _ready():
	position = get_viewport_rect().size / 2
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	position += direction * speed * delta
	if (position.y > get_viewport_rect().size.y or position.y < 0) :
		direction.y = -direction.y
	
	if (position.x < 0) :
		emit_signal("point_for_player_2")
	
	if (position.x > get_viewport_rect().size.x) :
		emit_signal("point_for_player_1")
		
	if (position.x < 0 or position.x > get_viewport_rect().size.x) :
		position = get_viewport_rect().size / 2
