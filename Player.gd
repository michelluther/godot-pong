extends Area2D
signal hit

@export var speed = 400
var screen_size # Size of the game window.
var _ball_dir: int

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	if name == "player_1":
		position = Vector2(30,screen_size.y / 2)
		_ball_dir = 1
	else:
		position = Vector2(screen_size.x - 30,screen_size.y / 2)
		_ball_dir = -1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_up_" + name):
		velocity.y -= 1
		$FeuerUnten.play("moving")
	else:
		$FeuerUnten.animation = "idle"
	if Input.is_action_pressed("move_down_" + name):
		velocity.y += 1
		$FeuerOben.play("moving")
	else:
		$FeuerOben.animation = "idle"
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()

	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)


func _on_area_entered(area: Area2D) -> void:
	if area.name == "Ball":
		# Assign new direction.
		area.direction = Vector2(_ball_dir, area.direction.y).normalized()
	
